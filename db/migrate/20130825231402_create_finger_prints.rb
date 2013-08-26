class CreateFingerPrints < ActiveRecord::Migration
  def change
    create_table :finger_prints do |t|
      t.text :finger_print
      t.text :notes

      t.timestamps
    end
  end
end
