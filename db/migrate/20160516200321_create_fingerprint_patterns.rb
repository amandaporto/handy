class CreateFingerprintPatterns < ActiveRecord::Migration
  def change
    create_table :fingerprint_patterns do |t|
      t.string :name
    end
  end
end
