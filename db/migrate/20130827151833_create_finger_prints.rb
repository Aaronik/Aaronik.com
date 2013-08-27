class CreateFingerPrints < ActiveRecord::Migration
  def change
    create_table :finger_prints do |t|
			t.integer :finger_print, limit: 8
			t.text :notes

			t.timestamps
		end
  end
end
