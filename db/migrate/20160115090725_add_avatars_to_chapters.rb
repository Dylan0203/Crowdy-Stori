class AddAvatarsToChapters < ActiveRecord::Migration
  def change
    add_column :chapters, :avatars, :text
  end
end
