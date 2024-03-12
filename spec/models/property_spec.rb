# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Property, type: :model do
  subject(:property) { build(:property) }

  describe 'validations' do
    it { should validate_presence_of(:title) }
    it { should validate_presence_of(:price) }
    it { should validate_numericality_of(:price).only_integer }
    it { should validate_presence_of(:description) }
  end

  describe 'associations' do
    it { should belong_to(:user) }
  end
end
#test
