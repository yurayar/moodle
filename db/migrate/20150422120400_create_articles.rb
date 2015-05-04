class CreateArticles < ActiveRecord::Migration
  def change
    create_table :articles do |t|
      t.string :title
      t.string :content
      t.integer :lecture_id

      t.timestamps null: false
    end
  end
end
