require 'rails_helper'

describe 'general information', type: :feature do
  describe 'The visitor visits the root path' do
    it 'has two logotypes' do
      visit root_path
      expect(page.all('.logo').count).to eq(2)
    end

    it 'has a button to the what page' do
      visit root_path
      expect(page).to have_link('what_button', href: what_path)
    end
  end

  describe 'The visitor visits the what_path' do
    it 'has a signup link' do
      visit what_path
      expect(page).to have_link('signup_button', href: choose_education_path)
    end

    it 'has a link to the programme page' do
      visit what_path
      expect(page).to have_link('programme_button', href: programme_path)
    end

    scenario 'The visitor visits the what_path from the root_path' do
      visit root_path
      click_link 'what_button'
      expect(page).to have_text 'Vad är Midhack?'
    end
  end
end
