# == Schema Information
#
# Table name: humen
#
#  id                      :integer          not null, primary key
#  name                    :string
#  email                   :string
#  created_at              :datetime         not null
#  updated_at              :datetime         not null
#  uuid                    :string
#  team_id                 :integer
#  study_year              :integer
#  course_id               :integer
#  competence_id           :integer
#  signed_up               :boolean          default("false")
#  welcome_email_sent      :boolean          default("false")
#  email_confirmed         :boolean          default("false")
#  email_confirmation_hash :text
#  confirm_email_expire_at :datetime
#
# Indexes
#
#  index_humen_on_competence_id  (competence_id)
#  index_humen_on_course_id      (course_id)
#  index_humen_on_signed_up      (signed_up)
#  index_humen_on_team_id        (team_id)
#  index_humen_on_uuid           (uuid)
#

require 'rails_helper'

RSpec.describe Human, type: :model do
  describe 'email' do
    it 'should not be able to contain example.com domain' do
      expect(Human.create(email: 'test@example.com').persisted?).to eq(false)
    end
    it 'should not be able to contain example.net domain' do
      expect(Human.create(email: 'test@example.net').persisted?).to eq(false)
    end
    it 'should not be able to contain example.org domain' do
      expect(Human.create(email: 'test@example.org').persisted?).to eq(false)
    end

    it 'should be able to contain example.org in user part' do
      expect(Human.create(email: 'example.org@mittmedia.se').persisted?).to eq(true)
    end
    it 'should be able to contain example.com in user part' do
      expect(Human.create(email: 'example.com@mittmedia.se').persisted?).to eq(true)
    end
    it 'should be able to contain example.net in user part' do
      expect(Human.create(email: 'example.net@mittmedia.se').persisted?).to eq(true)
    end
    it 'should be able to contain example in user part' do
      expect(Human.create(email: 'example@mittmedia.se').persisted?).to eq(true)
    end

    it 'should be persistable with valid email adress' do
      h = Human.create(email: 'dmu@mittmedia.com')
      expect(h.persisted?).to eq(true)
      h.destroy
    end

    it 'is required to be unique among signed_up human' do
      h1 = Human.create(email: 'dmu@mittmedia.com', signed_up: true)
      h2 = Human.create(email: 'dmu@mittmedia.com')
      expect(h1.persisted?).to eq(true)
      expect(h2.persisted?).to eq(false)
    end

    it 'should not limit reregistering if a humen has previously quit' do
      h1 = Human.create(email: 'dmu@mittmedia.com', signed_up: false)
      h2 = Human.create(email: 'dmu@mittmedia.com')
      expect(h1.persisted?).to eq(true)
      expect(h2.persisted?).to eq(true)
    end
  end

  describe 'generate_email_confirmation_hash' do
    it 'generates hashes without altering model' do
      h = Human.create(email: 'dmu@mittmedia.se', signed_up: true)
      expect(h.email_confirmation_hash).to eq(nil)
      expect(h.generate_email_confirmation_hash).not_to eq(false)
      expect(h.email_confirmation_hash).to eq(nil)
    end
    it 'does not generate a hashes when email is missing' do
      h = Human.create
      expect(h.generate_email_confirmation_hash).to eq(false)
    end
  end
end
