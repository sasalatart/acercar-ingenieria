class CreateDistinguishedSectionAdmins < ActiveRecord::Migration[5.0]
  def change
    create_table :distinguished_section_admins do |t|
      t.references :distinguished_section, foreign_key: true
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
