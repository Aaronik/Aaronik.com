class AddVisitCountToInfo < ActiveRecord::Migration
  def change
    add_column :infos, :visit_count, :integer
  end
end
