class ChangeFingerPrintFormatInFingerPrint < ActiveRecord::Migration
  def self.up
   change_column :finger_prints, :finger_print, :integer
  end

  def self.down
   change_column :finger_prints, :finger_print, :text
  end
end
