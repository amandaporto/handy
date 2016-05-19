FactoryGirl.define do
  # nail_status = %w(short, long, bitten, broken, pulled)
  # hand_position = %w(left, right)

  factory :finger do

  end

  factory :fingerprint_pattern do

  end

  factory :fingerprint do

  end

  factory :hand do
    # position {hand_position}
  end

  factory :nail do
    # status {nail_status}
    # finger_id
  end

end
