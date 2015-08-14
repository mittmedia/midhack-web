require 'rails_helper'

describe 'the signup process', type: :feature, js: true do
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
      expect(page).to have_link('what_button', href: what_path)
    end
  end

  describe 'the visitor visits the what_path' do
    it 'has a signup link' do
      visit what_path
      expect(page).to have_link('signup_button', href: signup_path)
    end

    it 'has a read more link' do
      visit what_path
      expect(page).to have_link('why_button')
    end

    scenario 'the visitor visits the what_path from the root_path' do
      visit root_path
      click_link 'what_button'
      expect(page).to have_text 'Vad är Midhack'
    end
  end

  describe 'the visitor visits the why_path' do
    it 'has a signup link' do
      visit why_path
      expect(page).to have_link('signup_button')
    end

    scenario 'the visitor visits the signup_path from the what_path' do
      visit why_path
      click_link 'signup_button'
      expect(page).to have_text 'Vad pluggar du?'
    end
  end
end
