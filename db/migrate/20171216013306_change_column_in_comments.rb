class ChangeColumnInComments < ActiveRecord::Migration[5.1]
  def change
    change_column :comments, :updated_at, :datetime, null: false
    change_column :comments, :created_at, :datetime, null: false 
  end
end
