class CreateVirtualRooms < ActiveRecord::Migration[5.0]
  def change
    create_table :virtual_rooms do |t|
      t.string :title
      t.text :description
      t.string :link
      t.datetime :date
      t.string :status, default: 'unarchived'
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
