class ChangeDefaultImage < ActiveRecord::Migration
  def change
    change_column :users, :avatar, :string, :default => "app/assets/images/fallback/default.jpg"
  end
end
