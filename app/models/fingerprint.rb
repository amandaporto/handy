class Fingerprint < ActiveRecord::Base
  enum status: [:normal, :burnt, :erased, :cut]

  belongs_to :finger
  belongs_to :fingerprint_pattern

  validates :finger_id,               presence: true
  validates :fingerprint_pattern_id,  presence: true
end
