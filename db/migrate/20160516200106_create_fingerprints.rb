class CreateFingerprints < ActiveRecord::Migration
  def change
    create_table :fingerprints do |t|
      t.integer :status
      t.belongs_to :finger,               index: true
      t.belongs_to :fingerprint_pattern,  index: true
    end
  end
end
