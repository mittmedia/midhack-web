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
end

