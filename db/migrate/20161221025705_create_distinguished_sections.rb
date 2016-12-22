class CreateDistinguishedSections < ActiveRecord::Migration[5.0]
  def change
    create_table :distinguished_sections do |t|
      t.string :name
      t.text :description

      t.timestamps
    end
  end
end
