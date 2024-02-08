class CreateSweetTagRelations < ActiveRecord::Migration[6.1]
  def change
    create_table :sweet_tag_relations do |t|
      t.references :sweet, null: false, foreign_key: true
      t.references :tag, null: false, foreign_key: true

      t.timestamps
    end
  end
end
