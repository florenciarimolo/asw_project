class CreateIssuesWatches < ActiveRecord::Migration[5.1]
  def change
    create_table :issues_watches do |t|
      t.string :username, null: false
      t.integer :issue_id, null: false
    end
    add_index :issues_watches, [:username, :issue_id], unique: true
    add_foreign_key :issues_watches, :users, column: :username, primary_key: "username"
    add_foreign_key :issues_watches, :issues, column: :issue_id, primary_key: "id"
  end
end
