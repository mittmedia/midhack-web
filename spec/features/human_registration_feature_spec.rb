require 'rails_helper'

describe 'the signup process', type: :feature do
  before(:each) do
    @team = FactoryGirl.create(:team)
    @institution = FactoryGirl.create(:institution)
    @course = FactoryGirl.create(:course, institution: @institution)
  end

  describe 'The visitor visits the rooth path' do
    it 'has a logo' do
      visit root_path
      expect(page.all('.logo').count).to eq(1)
    end

    it 'has a button to the what page' do
      visit root_path
      expect(page).to have_link('Vad är Midhack?', href: what_path)
    end
  end

  describe 'the visitor visits the what_path' do
    it 'has a signup link' do
      visit what_path
      expect(page).to have_link('Ja, anmäl mig till Midhack', href: signup_path)
    end

    it 'has a read more link' do
      visit what_path
      expect(page).to have_link('Jag vill läsa mer')
    end

    scenario 'the visitor visits the what_path from the root_path' do
      visit root_path
      click_link 'Vad är Midhack?'
      expect(page).to have_text 'Vad är Midhack'
    end
  end
end
