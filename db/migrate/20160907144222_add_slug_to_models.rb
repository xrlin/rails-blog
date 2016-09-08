class AddSlugToModels < ActiveRecord::Migration[5.0]
  def change
    add_column :posts, :slug, :string
    add_index :posts, :slug, using: :btree
    add_column :categories, :slug, :string
    add_index :categories, :slug, using: :btree
    add_column :tags, :slug, :string
    add_index :tags, :slug, using: :btree
  end
end
