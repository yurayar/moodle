class CreateAnnouncements < ActiveRecord::Migration
  def change
    create_table :announcements do |t|
      t.string :content
      t.string :title

      t.timestamps null: false
    end
  end
end
