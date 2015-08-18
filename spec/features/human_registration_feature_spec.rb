require 'rails_helper'

describe 'the signup process', type: :feature do
  before(:each) do
    @team = FactoryGirl.create(:team)
    @course = FactoryGirl.create(:course)
    @competence = FactoryGirl.create(:competence)
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

  describe 'The visitor picks course and study year' do
    it 'has more than one course button' do
      visit signup_path
      expect(page).to have_css('div.course_button')
      expect(page).to have_css('div.year', count: 1)
    end
  end

  # describe 'Teams are displayed' do
  #   it 'has a name' do
  #     visit signup_path
  #     expect(page).to have_css('#chooseteam')
  #     expect(page).to have_text 'Coolt! Vi behöver hackers i dessa lag:'
  #   end
  # end

  describe 'Visitor picks a team' do
    it 'teams are available' do
      visit signup_path
      click_link('År 1')
      click_link('Programmering')
      click_link('testteam')
      expect(page).to have_css('#email')
      expect(page).to have_text 'Nästan klar! Nu behövs bara din mail.'
      fill_in 'email', with: 'hej@example.com'
      click_button 'submit_button'
      expect(page).to have_text 'Suveränt! Nu har vi allt vi behöver.'
    end
  end
end
