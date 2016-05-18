class FingerprintPattern < ActiveRecord::Base
  VALID_PATTERNS = [
    'Plain Arch',
    'Tented Arch',
    'Radial Loop',
    'Ulnar Loop',
    'Plain Whorl',
    'Central Pocket Whorl',
    'Double Loop Whorl',
    'Accidental Whorl'
  ]

  has_many :fingerprints

  validates :name, presence: true, uniqueness: true
end
