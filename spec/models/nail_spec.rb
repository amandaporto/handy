
require 'rails_helper'

RSpec.describe Nail, type: :model do

  describe 'associations' do
    it { is_expected.to belongs_to(:finger) }
  end

  describe 'validations' do
    it { is_expected.to validate_presence_of(:finger_id) }
  end
end

# def scratch(scratchable = "nose")
#   "scratching #{scratchable}..."
# end

# test that you are scartching whatever is scratchable
