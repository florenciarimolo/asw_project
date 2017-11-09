class AddIndexToUser < ActiveRecord::Migration[5.1]
  def change
      add_index :users, :username
      add_index :users, :id
  end
end
