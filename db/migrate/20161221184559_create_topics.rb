class CreateTopics < ActiveRecord::Migration[5.0]
  def change
    create_table :topics do |t|
      t.string :title
      t.text :description
      t.string :status, default: 'unarchived'
      t.integer :user_admin_rank
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
