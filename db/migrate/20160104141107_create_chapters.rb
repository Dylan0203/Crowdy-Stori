class CreateChapters < ActiveRecord::Migration
  def change
    create_table :chapters do |t|
      t.string :topic
      t.string :ancestry, :index => true
      t.text :setting
      t.text :content
      t.boolean :finish
      t.integer :user_id, :index => true
      t.integer :ancestry_depth, :default => 0
      t.integer :view, :default => 0
      t.integer :comments_count, :default => 0

      t.timestamps null: false
    end
  end
end
