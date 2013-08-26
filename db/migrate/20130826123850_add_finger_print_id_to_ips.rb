class AddFingerPrintIdToIps < ActiveRecord::Migration
  def change
    add_column :ips, :finger_print_id, :integer
  end
end
