class CreateLandingPhotos < ActiveRecord::Migration[5.0]
  def change
    create_table :landing_photos do |t|
      t.string :title, default: ''
      t.text :text, default: ''
      t.boolean :pinned, default: false

      t.timestamps
    end
  end
end
