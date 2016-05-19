# delegate :is_criminal?, to: :hand,        prefix: false
# delegate :scratch,      to: :nail,        prefix: false
#
# validates :hand_id,         presence: true
# validates :name,            presence: true
# validates :position,        presence: true

require 'rails_helper'

RSpec.describe Finger, type: :model do
  before do
    subject.hand = Hand.new
  end

  describe 'associations' do
    it { is_expected.to have_one(:nail) }
    it { is_expected.to have_one(:fingerprint) }
    it { is_expected.to belong_to(:hand) }
  end

  describe 'validations' do
    it { is_expected.to validate_presence_of(:hand_id) }
    it { is_expected.to validate_presence_of(:name) }
    it { is_expected.to validate_presence_of(:position) }
  end

  describe 'validate' do
    it 'is expected to call check_phalanges_count' do
      expect(subject).to receive(:check_phalanges_count)
      subject.valid?
    end
  end

  describe 'delegations' do
    it { is_expected.to delegate_method(:pattern).to(:fingerprint).with_prefix(true) }
    it { is_expected.to delegate_method(:is_criminal?).to(:hand) }
    it { is_expected.to delegate_method(:scratch).to(:nail) }

    # Old Syntax
    # it { should delegate_method(:pattern).to(:fingerprint).with_prefix(true) }
    # it { should delegate_method(:is_criminal?).to(:hand).with_prefix(false) }
    # it { should delegate_method(:scratch).to(:nail).with_prefix(false) }
  end

  describe '#check_phalanges_count' do

    context 'when is_criminal and is_malformed is true' do
      before do
        subject.is_malformed = true
        allow(subject).to receive(:is_criminal?).and_return(true)
      end

      it 'does not add error' do
        subject.__send__(:check_phalanges_count)
        expect(subject.errors.keys).to_not include(:phalanges_count)
      end
    end

    context "when is_criminal is true and is_malformed is false" do
      before do
        subject.is_malformed = false
        allow(subject).to receive(:is_criminal?).and_return(true)
      end

      it 'does not add error' do
        subject.__send__(:check_phalanges_count)
        expect(subject.errors.keys).to_not include(:phalanges_count)
      end
    end

    context "when is_criminal is false and is_malformed is true" do
      before do
        subject.is_malformed = true
        allow(subject).to receive(:is_criminal?).and_return(false)
      end

      it 'does not add error' do
        subject.__send__(:check_phalanges_count)
        expect(subject.errors.keys).to_not include(:phalanges_count)
      end
    end

    context "when both is_criminal or is_malformed is false" do
      before do
        subject.is_malformed = false
        allow(subject).to receive(:is_criminal?).and_return(false)
      end

      context 'when phalanges_count is present and between 2-3' do
        before do
          subject.phalanges_count = 2
        end

        it 'does not add error' do
          subject.__send__(:check_phalanges_count)
          expect(subject.errors.keys).to_not include(:phalanges_count)
        end
      end

      context 'when phalanges_count is not present ' do
        it 'adds error' do
          subject.__send__(:check_phalanges_count)
          expect(subject.errors.keys).to include(:phalanges_count)
        end
      end

      context 'when phalanges_count is present but count is not between 2-3' do
        before do
          subject.phalanges_count = 1
        end

        it 'adds error' do
          subject.__send__(:check_phalanges_count)
          expect(subject.errors.keys).to include(:phalanges_count)
        end
      end
    end
  end

end


# private
#
# def check_phalanges_count
#   unless is_criminal? || is_malformed?
#     errors.add(:phalanges_count, 'is invalid') unless phalanges_count.present? && phalanges_count.between?(2,3)
#   end
# end
