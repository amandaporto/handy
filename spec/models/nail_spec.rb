
require 'rails_helper'

RSpec.describe Nail, type: :model do

  describe 'associations' do
    it { is_expected.to belong_to(:finger) }
  end

  describe 'validations' do
    it { is_expected.to validate_presence_of(:finger_id) }
  end

  describe '#scratch' do
    context 'when no scratchable is passed' do
      it 'scratches nose' do
        expect(subject.scratch).to eq('scratching nose...')
      end
    end

    context 'when scratchable is passed' do
      let(:scratchable) {FFaker::Lorem.word}

      it 'scratches scratchable' do
          expect(subject.scratch(scratchable)).to eq("scratching #{scratchable}...")
      end
    end
  end
end
