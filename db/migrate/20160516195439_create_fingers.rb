class CreateFingers < ActiveRecord::Migration
  def change
    create_table :fingers do |t|
      t.integer     :position
      t.string      :name
      t.integer     :phalanges_count
      t.boolean     :is_malformed
      t.belongs_to  :hand, index: true
    end
  end
end
