class AddAnnCountToLectures < ActiveRecord::Migration
  def change
    add_column :lectures, :ann_count, :integer
  end
end
