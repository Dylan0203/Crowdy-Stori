class CreateProfiles < ActiveRecord::Migration
  def change
    create_table :profiles do |t|

      t.string :username
      t.string :picture
      t.string :voice
      t.string :gender
      t.date :birthday
      t.text :about_me
      t.string :bloodtype
      t.string :user_id, :index => true


      t.timestamps null: false
    end

    add_index :profiles, :username, unique: true
  end
end
