require 'rails_helper'

describe 'the signup process - email -', type: :feature do
  before(:each) do
    @human = FactoryGirl.create(:competent_educated_member)
    page.driver.browser.set_cookie("uuid=#{@human.uuid}")
  end

  describe 'The visitor visits the fill_email_path' do
    it 'and get presented an input to enter his/her email' do
      visit fill_email_path
      expect(page).to have_css('#fill_email')
      expect(page).to have_css('.labeled_input__input')
    end
    it 'and have to choose email after picking a email' do
      visit fill_email_path
      fill_in 'email', with: 'dmu@mittmedia.se'
      click_button 'submit_button'
      expect(current_path).to eq(receipt_path)
    end
  end
end
