require "rails_helper"

describe ConfirmationMailer, type: :mailer do
  describe 'confirmation_email' do
    let(:human) { FactoryGirl.create(:member) }
    let(:mail) { ConfirmationMailer.confirmation_email(human) }

    it 'renders the subject' do
      expect(mail.subject).to eql('Registrerad på Midhack')
    end
    it 'renders the receiver email' do
      expect(mail.to).to eql([human.email])
    end
    it 'renders the sender email' do
      expect(mail.from).to eql(['crew@midhack.se'])
    end

    it 'renders @quit_url in html-formatted version' do
      expect(html_body(mail)).to include(quit_url(uuid: human.uuid))
    end
    it 'renders @quit_url in plain-text version' do
      expect(plain_body(mail)).to include(quit_url(uuid: human.uuid))
    end

    it 'renders @url in html-formatted version' do
      expect(html_body(mail)).to include(receipt_url(uuid: human.uuid))
    end
    it 'renders @url in plain-text version' do
      expect(plain_body(mail)).to include(receipt_url(uuid: human.uuid))
    end

    it 'renders @confirm_email_url in html-formatted version' do
      email_confirmation_url = confirm_email_url(
         uuid: human.uuid,
         digest: human.email_confirmation_hash
      )
      expect(html_body(mail)).to include(email_confirmation_url)
    end
    it 'renders @confirm_email_url in plain-text version' do
      email_confirmation_url = confirm_email_url(
         uuid: human.uuid,
         digest: human.email_confirmation_hash
      )
      expect(plain_body(mail)).to include(email_confirmation_url)
    end

    it 'renders @confirm_email_expire_at in html-formatted version' do
      expect(html_body(mail)).to include("klockan 20:08 den 2015-12-01.")
    end
    it 'renders @confirm_email_expire_at in plain-text version' do
      expect(plain_body(mail)).to include("klockan 20:08 den 2015-12-01.")
    end
  end

  describe 'waitlist_confirmation_email' do
    pending "Not Implemented Yet"
  end

  describe 'deregistration_confirmation_email' do
    pending "Not Implemented Yet"
  end

end
