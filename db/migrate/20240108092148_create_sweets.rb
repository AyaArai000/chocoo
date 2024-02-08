class CreateSweets < ActiveRecord::Migration[6.1]
  def change
    create_table :sweets do |t|
      t.string :name
      t.text :about
      t.string :cook

      t.timestamps
    end
  end
end
