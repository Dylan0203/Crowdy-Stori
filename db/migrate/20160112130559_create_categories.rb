class CreateCategories < ActiveRecord::Migration
  def change
    create_table :categories do |t|

      t.string :name

      t.timestamps null: false
    end

    add_column :chapters, :category_id, :integer
    add_index :chapters, :category_id
  end
end
