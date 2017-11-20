class CreateIssuesVotes < ActiveRecord::Migration[5.1]
  def change
    create_table :issues_votes do |t|
      t.string :username, null: false
      t.integer :issue_id, null: false
    end
    add_index :issues_votes, [:username, :issue_id], unique: true
    add_foreign_key :issues_votes, :users, column: :username, primary_key: "username"
    add_foreign_key :issues_votes, :issues, column: :issue_id, primary_key: "id"
  end
end
