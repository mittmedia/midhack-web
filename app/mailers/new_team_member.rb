class NewTeamMember < ApplicationMailer
  def new_member_email(human, team_member_details)
    @team_member_details = team_member_details
    @url = receipt_url(uuid: human.uuid)

    headers('X-SMTPAPI' => '{"category": "New Member"}')
    mail(to: human.email, subject: 'Ny medlem i ditt Midhack-lag')
  end
end
