class AddSecondNameToUsers < ActiveRecord::Migration
  def change
    add_column :users, :second_name, :string
  end
end
