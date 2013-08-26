class CreateIps < ActiveRecord::Migration
  def change
    create_table :ips do |t|
      t.string :ip
      t.integer :count
      t.text :notes

      t.timestamps
    end
  end
end
