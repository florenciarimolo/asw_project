class CreateComments < ActiveRecord::Migration[5.1]
  def change
    create_table :comments do |t|
      t.string :usuari, null: false 
      t.string :comentari, null: false 
        
      t.belongs_to :issue
      
      t.timestamps
    end
  end
end
