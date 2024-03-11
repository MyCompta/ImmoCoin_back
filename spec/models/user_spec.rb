# frozen_string_literal: true

require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'validations' do
    it { should validate_presence_of(:email) }
    it { should validate_uniqueness_of(:email) }
    it { should validate_presence_of(:password) }
    it { should validate_length_of(:password).is_at_least(6).on(:create) }
    it { should validate_presence_of(:encrypted_password) }

    it 'validates email format' do
      should allow_value('user@example.com').for(:email)
      should_not allow_value('user@invalid').for(:email)
      should_not allow_value('user').for(:email)
    end
  end

  describe 'associations' do
    it { should have_many(:properties).dependent(:destroy) }
  end
end
