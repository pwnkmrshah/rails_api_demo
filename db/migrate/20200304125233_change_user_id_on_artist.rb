class ChangeUserIdOnArtist < ActiveRecord::Migration[6.0]
  def change
    change_column :artists, :user_id, :integer, :null => true

  end
end
