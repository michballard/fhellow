class AddUseridToStatus < ActiveRecord::Migration
  def change
    add_column :statuses, :user_id, :integer
  end
end
