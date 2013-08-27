class DropAllTablesForFreshIshRestart < ActiveRecord::Migration
  def change
  	#drop_table :infos
  	#drop_table :finger_prints
  	drop_table :Ips
  end
end
