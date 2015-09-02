require 'rails_helper'

describe 'the signup process - team -', type: :feature do
  before(:each) do
    DatabaseCleaner.clean_with(:truncation)
    @human = FactoryGirl.create(:competent_educated_human)
    page.driver.browser.set_cookie("uuid=#{@human.uuid}")
    @team = FactoryGirl.create(:team)
  end

  describe 'The visitor visits the choose_team_path' do
    it 'and get presented an overview of the available teams' do
      visit choose_team_path
      expect(page).to have_css('#choose_team')
      expect(page).to have_css('.btn_filler')
    end
    it 'and have to choose team after picking a team' do
      visit choose_team_path
      click_link('testteam')
      expect(current_path).to eq(fill_email_path)
    end
  end
end
describe 'The visitor visits the choose_team_path without education' do
    it 'is redirected to the first page' do
      visit choose_team_path
      expect(page).to have_css('#choose_education')
    end
  end
