class ChangeCommentsModel < ActiveRecord::Migration[5.1]
  def change
      create_table :comments do |t|
      t.string :user, null: false 
      t.string :comment, null: false 
        
      t.belongs_to :issue
      
      t.timestamps
    end
  end
end
