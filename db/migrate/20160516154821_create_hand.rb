class CreateHand < ActiveRecord::Migration
  def change
    create_table :hands do |t|
      t.integer :position
      t.boolean :is_criminal
    end
  end
end
