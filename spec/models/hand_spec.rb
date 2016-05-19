
require 'rails_helper'

RSpec.describe Hand, type: :model do

  describe 'enums' do
     it { is_expected.to define_enum_for(:position).with({ :left, :right }) }
   end

  describe 'associations' do
    it { is_expected.to have_many(:fingers) }
  end
end
