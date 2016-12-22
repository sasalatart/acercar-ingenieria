class CreateDistinguishedVirtualRooms < ActiveRecord::Migration[5.0]
  def change
    create_table :distinguished_virtual_rooms do |t|
      t.references :distinguished_section, foreign_key: true
      t.references :virtual_room, foreign_key: true

      t.timestamps
    end
  end
end
