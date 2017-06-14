class ChangeUsernameFromUser < ActiveRecord::Migration[5.1]
  def up
    change_column :users, :username, :string, limit: 50, null: false
    change_column :users, :email, :string, limit: 50, null: false
  end

  def down
    change_column :users, :username, :text
    change_column :users, :email, :text
  end
end
