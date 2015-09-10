class ApplicationMailer < ActionMailer::Base
  default from: 'Midhack Crew <crew@midhack.se>',
          reply_to: 'Midhack Crew <crew@midhack.se>',
          bcc: 'midhack@mittmedia.flowdock.com'
  layout 'mailer'
end
