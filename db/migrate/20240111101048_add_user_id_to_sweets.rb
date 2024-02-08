class AddUserIdToSweets < ActiveRecord::Migration[6.1]
  def change
    add_column :sweets, :user_id, :integer
  end
end
