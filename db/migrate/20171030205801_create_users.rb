class CreateUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :users, id: false do |t|
      t.string :username, primary_key: true
      t.string :full_name
      t.string :email

      t.timestamps
    end
  end
end
