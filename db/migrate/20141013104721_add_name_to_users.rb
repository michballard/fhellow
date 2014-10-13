class AddNameToUsers < ActiveRecord::Migration
  def change
    add_column :users, :name_last, :string
    add_column :users, :name_first, :string
    add_column :users, :bio, :text
    add_column :users, :location, :string
  end
end
