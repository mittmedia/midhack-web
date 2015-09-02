require 'rails_helper'

describe 'the signup process - competence -', type: :feature do
  before(:each) do
    DatabaseCleaner.clean_with(:truncation)
    @human = create_human :educated_human
    @competence = FactoryGirl.create(:competence)
  end

  describe 'The visitor visits the choose_competence_path' do
    it 'and get presented an overview of the available competences' do
      visit choose_competence_path
      expect(page).to have_css('#choose_competence')
      expect(page).to have_css('.competence')
    end
    it 'and have to choose team after picking a competence' do
      visit choose_competence_path
      click_link('Programming')
      expect(current_path).to eq(choose_team_path)
    end
  end
end

describe 'the signup process failures - competence -', type: :feature do
  before(:each) do
    @human = create_human :human
    @competence = FactoryGirl.create(:competence)
  end

  describe 'The visitor visits the choose_competence_path without education' do
    it 'is redirected to the first page' do
      visit choose_competence_path
      expect(page).to have_css('#choose_education')
    end
  end
end
