class CreateIssues < ActiveRecord::Migration[5.1]
  def change
    create_table :issues do |t|
      t.string :title
      t.string :kind
      t.string :priority
      t.string :status
      t.integer :votes
      t.string :assignee
      t.datetime :created
      t.datetime :updated
      t.string :description

      t.timestamps
    end
  end
end
