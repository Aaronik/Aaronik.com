class DropAllTables < ActiveRecord::Migration
  def change
  	drop_table :finger_prints
  	drop_table :ips
  end
end
