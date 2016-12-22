class CreateImpressions < ActiveRecord::Migration[5.0]
  def change
    create_table :impressions do |t|
      t.string :ip_address
      t.references :user, foreign_key: true
      t.references :impressionable, polymorphic: true

      t.timestamps
    end
  end
end
