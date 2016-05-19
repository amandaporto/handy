
require 'rails_helper'

RSpec.describe Finger, type: :model do

  describe 'associations' do
    it { is_expected.to have_one(:nail) }
    it { is_expected.to have_one(:fingerprint) }
    it { is_expected.to belongs_to(:hand) }
  end

  describe 'validations' do
    it { is_expected.to validate_presence_of(:hand_id) }
    it { is_expected.to validate_presence_of(:name) }
    it { is_expected.to validate_presence_of(:position) }
  end

  describe "validate" do

  end
    # check if method gets called when instancae.valid
    it { is_expected.to validate_presence_of(:check_phalanges_count) }

  describe "delegations" do
    it { is_expected.to delegate_method(:pattern).to(:fingerprint).with_prefix(true) }
    it { is_expected.to delegate_method(:is_criminal?).to(:hand).with_prefix(false) }
    it { is_expected.to delegate_method(:scratch).to(:nail).with_prefix(false) }

    # Old Syntax
    it { should delegate_method(:pattern).to(:fingerprint).with_prefix(true) }
    it { should delegate_method(:is_criminal?).to(:hand).with_prefix(false) }
    it { should delegate_method(:scratch).to(:nail).with_prefix(false) }
  end

end


# private
#
# def check_phalanges_count
#   unless is_criminal? || is_malformed?
#     errors.add(:phalanges_count, 'is invalid') unless phalanges_count.present? && phalanges_count.between?(2,3)
#   end
# end

# ... and what the method does
# context within the context for second unless
# 4 scenarios for 1st unless
# 3 scenarios for 2nd unless
