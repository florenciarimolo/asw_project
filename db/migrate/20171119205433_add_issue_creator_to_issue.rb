class AddIssueCreatorToIssue < ActiveRecord::Migration[5.1]
  def change
    add_column :issues, :issue_creator, :string
    add_foreign_key :issues, :users, column: :issue_creator, primary_key: "username"
  end
end
