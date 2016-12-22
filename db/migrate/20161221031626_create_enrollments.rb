class CreateEnrollments < ActiveRecord::Migration[5.0]
  def change
    create_table :enrollments do |t|
      t.references :user, foreign_key: true
      t.references :enrollable, polymorphic: true

      t.timestamps
    end
  end
end
