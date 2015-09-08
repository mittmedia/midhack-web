module MailerSupport
  def email_body(mail, part)
    mail.body.parts.find {|p| p.content_type.match /#{part}/}.body.raw_source
  end
  def html_body(mail)
    email_body(mail, 'html')
  end
  def plain_body(mail)
    email_body(mail, 'plain')
  end
end
RSpec.configure { |config| config.include MailerSupport }
