class AddCompInfoToFingerPrint < ActiveRecord::Migration
  def change
  	add_column :finger_prints, :comp_info, :text
  end
end
