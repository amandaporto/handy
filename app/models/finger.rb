class Finger < ActiveRecord::Base
  belongs_to :hand

  has_one :nail
  has_one :fingerprint

  delegate :pattern,      to: :fingerprint, prefix: true
  delegate :is_criminal?, to: :hand,        prefix: false
  delegate :scratch,      to: :nail,        prefix: false

  validates :hand_id,         presence: true
  validates :name,            presence: true
  validates :position,        presence: true

  validate  :check_phalanges_count

  private

  def check_phalanges_count
    unless is_criminal? || is_malformed?
      errors.add(:phalanges_count, 'is invalid') unless phalanges_count.present? && phalanges_count.between?(2,3)
    end
  end
end
