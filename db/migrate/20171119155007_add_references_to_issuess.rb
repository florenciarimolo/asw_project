class AddReferencesToIssuess < ActiveRecord::Migration[5.1]
  def change
    add_reference :issues, :issue_list, foreign_key: true
  end
end
