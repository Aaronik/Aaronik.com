class TryAgainToDropAll < ActiveRecord::Migration
  def change
  	drop_table :infos
  	drop_table :finger_prints
  end
end
