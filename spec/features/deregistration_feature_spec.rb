require 'rails_helper'

describe 'the deregistration process', type: :feature do
  before :each do
    DatabaseCleaner.clean_with(:truncation)
    @human = create_human :member
  end

  describe 'The visitor visits the receipt_path' do
    it 'and get presented an option to quit' do
      visit receipt_path
      expect(page).to have_css '#drop_out_action'
    end
    it 'and clicking drop_out_action navigates to quit_path' do
      visit receipt_path
      click_link 'drop_out_action'
      expect(current_path).to eq quit_path uuid: @human.uuid
    end
  end

  describe 'The visitor visits the quit_path' do
    it 'without uuid included and get redirected to root_path' do
      clear_human
      visit quit_path
      expect(current_path).to eq root_path
    end
    it 'and finds a quit_btn' do
      visit quit_path uuid: @human.uuid
      expect(page).to have_css '#quit_btn'
    end
    it 'clicks the quit_btn and deregisters' do
      visit quit_path uuid: @human.uuid
      expect { click_link 'quit_btn' }.to change { ActionMailer::Base.deliveries.count }.by(1)
      expect(current_path).to eq unregistered_path
    end
  end
end
