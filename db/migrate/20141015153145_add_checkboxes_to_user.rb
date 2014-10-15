class AddCheckboxesToUser < ActiveRecord::Migration
  def change
    add_column :users, :discussing_ideas, :boolean
    add_column :users, :afterwork_drinks, :boolean
    add_column :users, :collaborating, :boolean
    add_column :users, :chat_over_a_coffee, :boolean
    add_column :users, :lunch_buddy, :boolean
    add_column :users, :advising, :boolean
  end
end
