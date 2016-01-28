class AddInterestToUserProfile < ActiveRecord::Migration
  def change
  	add_column :profiles, :interest, :text, :default => ""
  end
end
