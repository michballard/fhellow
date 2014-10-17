class AddTownToPosts < ActiveRecord::Migration
  def change
    add_column :posts, :town, :string
  end
end
