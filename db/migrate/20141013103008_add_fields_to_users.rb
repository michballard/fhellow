class AddFieldsToUsers < ActiveRecord::Migration
  def change
    add_column :users, :job_title, :string
    add_column :users, :interests, :string
    add_column :users, :longitude, :decimal
    add_column :users, :latitude, :decimal
  end
end
