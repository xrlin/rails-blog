class CreateCategories < ActiveRecord::Migration[5.0]
  def change
    create_table :categories do |t|
      t.string :name, null: false
      t.timestamps
      t.index :name, unique: true, using: :btree
    end

    change_table :posts do |t|
      t.belongs_to :category
      t.index :title, using: :btree
    end
  end
end
