class AddIndexToUsers < ActiveRecord::Migration[6.1]
  def change
    add_index :projects, :user_id
  end
end
