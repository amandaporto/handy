class Hand < ActiveRecord::Base
  enum position: [:left, :right]

  has_many :fingers
end
