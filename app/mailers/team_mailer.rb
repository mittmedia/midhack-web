class TeamMailer < ApplicationMailer
  def new_member_email(new_member, team_member_details)
    @new_member = new_member
    @team_member_details = team_member_details
    @url = why_url
    @unsubscribe_url = quit_url(uuid: @new_member.uuid)
    headers('X-SMTPAPI' => '{"category": "New Team Member"}')
    subject =  t('.subject', member: @new_member.email)
    team_member_details.each do |tmd|
      mail(to: tmd.first, subject: subject)
    end
  end

  def lost_member_email(lost_member, team_member_details)
    @lost_member = lost_member
    @team_member_details = team_member_details
    @url = why_url
    @unsubscribe_url = quit_url(uuid: @lost_member.uuid)
    headers('X-SMTPAPI' => '{"category": "Lost Team Member"}')
    subject = t('.subject', member: @lost_member.email)
    team_member_details.each do |tmd|
      mail(to: tmd.first, subject: subject)
    end
  end
end
