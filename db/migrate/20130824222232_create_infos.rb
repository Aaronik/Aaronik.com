class CreateInfos < ActiveRecord::Migration
  def change
    create_table :infos do |t|
      t.string :ip
      t.text :notes

      t.timestamps
    end
  end
end
