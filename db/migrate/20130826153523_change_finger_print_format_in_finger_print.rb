class ChangeFingerPrintFormatInFingerPrint < ActiveRecord::Migration
  def up
  connection.execute(%q{
    alter table tweets
    alter column number
    type integer using cast(number as integer)
  })
end

  def self.down
   change_column :finger_prints, :finger_print, :text
  end
end
