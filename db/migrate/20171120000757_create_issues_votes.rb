class CreateIssuesVotes < ActiveRecord::Migration[5.1]
  def change
    create_table :issues_votes do |t|
      t.integer :issue_id, null: false
      t.string :username, null: false
    end
    add_index :issues_votes, [:issue_id, :username], unique: true
    add_foreign_key :issues_votes, :issues, column: :issue_id, primary_key: "id"
    add_foreign_key :issues_votes, :users, column: :username, primary_key: "username"
  end
end
