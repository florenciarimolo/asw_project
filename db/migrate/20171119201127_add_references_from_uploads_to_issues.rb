class AddReferencesFromUploadsToIssues < ActiveRecord::Migration[5.1]
  def change
    add_reference :uploads, :issues, foreign_key: true
  end
end