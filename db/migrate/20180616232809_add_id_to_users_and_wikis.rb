class AddIdToUsersAndWikis < ActiveRecord::Migration[5.1]
  def change
    add_index :users, :id, unique: true
    add_index :wikis, :id, unique: true
  end
end
