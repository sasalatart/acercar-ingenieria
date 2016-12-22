class AddImageColumnsToLandingPhotos < ActiveRecord::Migration[5.0]
  def up
    add_attachment :landing_photos, :image
  end

  def down
    remove_attachment :landing_photos, :image
  end
end
