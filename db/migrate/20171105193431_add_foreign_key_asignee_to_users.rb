class AddForeignKeyAsigneeToUsers < ActiveRecord::Migration[5.1]
  def change
    add_foreign_key :issues, :users, column: :assignee, primary_key: "username"
  end
end
