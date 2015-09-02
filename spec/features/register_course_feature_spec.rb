require 'rails_helper'

describe 'the signup process - course -', type: :feature do
  before(:each) do
    DatabaseCleaner.clean_with(:truncation)
    @course = FactoryGirl.create(:course)
  end

  describe 'The visitor starts signing up for the event' do
    it 'and get an overview of the courses' do
      visit choose_education_path
      expect(page).to have_css('.course')
      expect(page).to have_css('div.year', count: 1)
    end
    it 'and has to choose competence after picking a course and study year' do
      visit choose_education_path
      click_link('Year 1')
      expect(current_path).to eq(choose_competence_path)
    end
  end
end
