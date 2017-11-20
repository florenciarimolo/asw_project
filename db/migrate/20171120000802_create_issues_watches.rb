class CreateIssuesWatches < ActiveRecord::Migration[5.1]
  def change
    create_table :issues_watches do |t|
      t.integer :issue_id, null: false
      t.string :username, null: false
    end
    add_index :issues_watches, [:issue_id, :username], unique: true
    add_foreign_key :issues_watches, :issues, column: :issue_id, primary_key: "id"
    add_foreign_key :issues_watches, :users, column: :username, primary_key: "username"
  end
end
