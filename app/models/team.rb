# == Schema Information
#
# Table name: teams
#
#  id         :integer          not null, primary key
#  name       :string
#  color      :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Team < ActiveRecord::Base
  has_many :humen

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

  def self.get_title(competence)
    titles = {
      economics: 'ekonomer',
      gd: 'designers',
      it: 'hackers',
      journalism: 'journalister'
    }
    titles[competence.to_sym]
  end

  def self.get_teams(competence)
    teams = Team.all
    return nil if teams.blank?
    teams.select do |team|
      members = team.humen.select do |human|
        human.course.competence == competence && !human.email.blank?
      end
      members.length < MAXMEMBERS[competence.to_sym]
    end
  end

  def self.available_team?(team_id, competence)
    available_teams = Team.get_teams(competence)
    chosen_team = Team.find_by(id: team_id)
    return false if available_teams.blank? || chosen_team.blank?
    available_teams.include?(chosen_team)
  end

  def rank_team(competence, study_year)
    members = humen
    total_years = 0
    num_members = members.length
    competences = { economics: 0, gd: 0, it: 0, journalism: 0 }

    members.each do |member|
      total_years += member.study_year
      competences[member.course.competence.to_sym] += 1
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

    competences[competence.to_sym] += 1
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
