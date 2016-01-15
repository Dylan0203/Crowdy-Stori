class AddAvatarToChapters < ActiveRecord::Migration
  def change
    add_column :chapters, :avatar, :string
  end
end
