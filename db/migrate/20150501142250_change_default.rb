class ChangeDefault < ActiveRecord::Migration
  def change
    change_column :users, :avatar, :string, :default => "http://www.lcfc.com/images/common/bg_player_profile_default_big.png"
  end
end
