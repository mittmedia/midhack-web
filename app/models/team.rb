# == Schema Information
#
# Table name: teams
#
#  id               :integer          not null, primary key
#  name             :string
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#  overview_api_key :string
#

class Team < ActiveRecord::Base
  has_many :humen
  has_many :members, -> { where signed_up: true }, class_name: "Human"
	validates :name, allow_blank: false, presence: true, uniqueness: true

	validates :name, allow_blank: false, presence: true, uniqueness: true

  MAXMEMBERS = {
    economics: 2,
    gd: 2,
    it: 4,
    journalism: 2
  }

  OPTIMAL_MEMBERS = {
    economics: 1,
    gd: 1,
    it: 3,
    journalism: 2
  }

  MAX_NUM_MEMBERS = 8

  def self.get_teams(competence)
    teams = Team.all
    return nil if teams.blank?
    teams.select do |team|
      members = team.humen.select do |human|
        human.competence.name == competence && !human.email.blank?
      end
      members.length < MAXMEMBERS[competence.to_sym]
    end
  end

  def self.sorted_teams(competence, study_year)
    all_teams = Team.preload(:members)
    all_teams = all_teams.sort do |team, other_team|
      team.rank(competence, study_year) <=> other_team.rank(competence, study_year)
    end
    {
      available_teams: Team.available_teams(competence, all_teams),
      competence_filled_teams: Team.competence_filled_teams(competence, all_teams),
      full_teams: Team.full_teams(all_teams)
    }
  end

  def self.available_teams(competence, sorted_teams)
    sorted_teams.select do |team|
      team.available_team?(competence) && !team.full_team?
    end
  end

  def self.competence_filled_teams(competence, sorted_teams)
    sorted_teams.select do |team|
      !team.available_team?(competence) && !team.full_team?
    end
  end

  def self.full_teams(sorted_teams)
    sorted_teams.select(&:full_team?)
  end

  def full_team?
    humen.length >= MAX_NUM_MEMBERS
  end

  def available_team?(competence)
    members = humen.select do |human|
      human.competence == competence && !human.email.blank?
    end
    members.length < MAXMEMBERS[competence.name.to_sym]
  end

  def spots_left
    MAX_NUM_MEMBERS - humen.length
  end

  def self.competence_spots_left(incoming_competence)
    counter = 0
    humen.select(&:signed_up).each do |member|
      competence = member.competence
      counter += 1 if competence == incoming_competence
    end
    MAXMEMBERS[incoming_competence.name.to_sym] - counter
  end

  # Filled spots of the specific competence
  def filled_spots_percentage
    ((spots_left.to_f/MAX_NUM_MEMBERS.to_f)*100).to_i
  end

  def rank(competence, study_year)
    members = humen
    total_years = 0
    num_members = members.length
    competences = { economics: 0, gd: 0, it: 0, journalism: 0 }

    members.each do |member|
      total_years += member.study_year
      competences[member.competence.name.to_sym] += 1
    end

    competence_distance = 1 - competences[:economics]
    competence_distance += 1 - competences[:gd]
    competence_distance += 3 - competences[:it]
    competence_distance += 2 - competences[:journalism]
    member_distance = (7 - num_members)

    if num_members == 0
      average_study_years = 0
    else
      average_study_years = (total_years / num_members)
    end

    result_1 = competence_distance + member_distance - average_study_years

    competences[competence.name.to_sym] += 1
    num_members += 1
    total_years += study_year
    competence_distance = 1 - competences[:economics]
    competence_distance += 1 - competences[:gd]
    competence_distance += 3 - competences[:it]
    competence_distance += 2 - competences[:journalism]
    member_distance = (7 - num_members)
    average_study_years = (total_years / num_members)

    result_2 = competence_distance + member_distance - average_study_years

    result_2 - result_1
  end
end
