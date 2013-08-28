class AddLocationToIp < ActiveRecord::Migration
  def change
    add_column :ips, :location, :text
  end
end
