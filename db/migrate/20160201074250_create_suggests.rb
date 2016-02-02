class CreateSuggests < ActiveRecord::Migration
  def change
    create_table :suggests do |t|
    	t.string :topic
    	t.text :content
    	t.string :suggest_category
    	t.string :user_id, :index => true

      t.timestamps null: false
    end
  end
end
