
require 'rails_helper'

RSpec.describe Fingerprint, type: :model do

  describe 'enums' do
     it { is_expected.to define_enum_for(:status).with([:normal, :burnt, :erased, :cut ]) }
   end

  describe 'associations' do
    it { is_expected.to belong_to(:finger) }
    it { is_expected.to belong_to(:fingerprint_pattern) }
  end

  describe 'validations' do
    it { is_expected.to validate_presence_of(:finger_id) }
    it { is_expected.to validate_presence_of(:fingerprint_pattern_id) }
  end

end
