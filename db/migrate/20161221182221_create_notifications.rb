class CreateNotifications < ActiveRecord::Migration[5.0]
  def change
    create_table :notifications do |t|
      t.boolean :read, default: false
      t.string :action
      t.integer :notificator_admin_rank, default: 0
      t.references :user, foreign_key: true
      t.references :notificator
      t.references :notifyable, polymorphic: true

      t.timestamps
    end
  end
end
