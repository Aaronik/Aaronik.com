class CreateIps < ActiveRecord::Migration
  def change
    create_table :ips do |t|
  		t.string :ip
  		t.integer :visit_count
  		t.integer :finger_print_id
  		t.text :notes

  		t.timestamps
  	end
  end
end
