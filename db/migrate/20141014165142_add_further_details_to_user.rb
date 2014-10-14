class AddFurtherDetailsToUser < ActiveRecord::Migration
  def change
    add_column :users, :country, :string
    add_column :users, :town, :string
    add_column :users, :website, :string
    add_column :users, :linkedin, :string
  end
end
