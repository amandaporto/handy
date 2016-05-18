class CreateNails < ActiveRecord::Migration
  def change
    create_table :nails do |t|
      t.integer     :status
      t.boolean     :is_polished
      t.boolean     :has_fungi
      t.belongs_to  :finger, index: true
    end
  end
end
