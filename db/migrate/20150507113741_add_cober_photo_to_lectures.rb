class AddCoberPhotoToLectures < ActiveRecord::Migration
  def change
    add_column :lectures, :coverphoto, :string
  end
end
