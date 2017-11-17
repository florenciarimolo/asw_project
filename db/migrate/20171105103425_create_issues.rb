class CreateIssues < ActiveRecord::Migration[5.1]
  def change
    create_table :issues do |t|
      t.string :title, null: false 
      t.string :kind, null: false 
      t.string :priority, null: false 
      t.string :status, null: false 
      t.integer :votes, null: false 
      t.string :assignee
      t.string :description

      t.timestamps
    end
  end
end
