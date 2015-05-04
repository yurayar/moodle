class RemoveDefaultFromUser < ActiveRecord::Migration
  def change
    def change
      change_column :users, :avatar, :string, :default => "app/assets/images/fallback/default.jpg"
    end
  end
end
