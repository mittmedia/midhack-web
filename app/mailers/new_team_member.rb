class NewTeamMember < ApplicationMailer
  def new_member_email(human)
    @human = human
    @url = receipt_url(uuid: human.uuid)

    headers('X-SMTPAPI' => '{"category": "New Member"}')
    mail(to: @human.email, subject: 'Ny medlem i ditt Midhack-lag')
  end
end
