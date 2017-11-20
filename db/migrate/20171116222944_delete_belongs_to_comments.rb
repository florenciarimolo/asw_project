class DeleteBelongsToComments < ActiveRecord::Migration[5.1]
  def change
    create_table :comments do |t|
      t.string :user, null: false 
      t.string :comment, null: false 
      t.string :issue_id, null: false
      
      t.timestamps
    end
      add_foreign_key :comments, :issues, column: :issue_id, primary_key: "id"
  end
end
