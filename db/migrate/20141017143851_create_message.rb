class CreateMessage < ActiveRecord::Migration
  def change
    create_table :messages do |t|
      t.integer :to_id
      t.integer :from_id
      t.datetime :created_at
      t.datetime :updated_at
      t.text :message
      t.string :conversation_code
      t.boolean :seen
    end
  end
end
