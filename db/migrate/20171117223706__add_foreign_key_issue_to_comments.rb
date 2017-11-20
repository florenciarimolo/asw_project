class AddForeignKeyIssueToComments < ActiveRecord::Migration[5.1]
  def change
       add_foreign_key :comments, :issues, column: :issue, primary_key: "id"
  end
end
