class TeamMailer < ApplicationMailer
  def new_member_email(human, team_member_details)
    @human = human
    @team_member_details = team_member_details
    @url = why_url
    @unsubscribe_url = quit_url(uuid: @human.uuid)
    headers('X-SMTPAPI' => '{"category": "New Team Member"}')
    mail(to: @human.email, subject: 'Ny medlem i ditt Midhack-lag')
  end
end
