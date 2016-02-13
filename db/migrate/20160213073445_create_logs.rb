class CreateLogs < ActiveRecord::Migration
  def change
    create_table :logs do |t|
    	t.date :logtime
    	t.string :topic
    	t.text :content
    	t.string :user_id, :index => true

      t.timestamps null: false
    end
  end
end
