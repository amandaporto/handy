class Nail < ActiveRecord::Base
  enum status: [:short, :long, :bitten, :broken, :pulled]

  belongs_to :finger

  validates :finger_id, presence: true

  def scratch(scratchable = "nose")
    "scratching #{scratchable}..."
  end
end
