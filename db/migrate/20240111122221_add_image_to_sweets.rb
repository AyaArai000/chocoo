class AddImageToSweets < ActiveRecord::Migration[6.1]
  def change
    add_column :sweets, :image, :string
  end
end
