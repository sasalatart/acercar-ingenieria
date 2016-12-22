class CreateMajors < ActiveRecord::Migration[5.0]
  def change
    create_table :majors do |t|
      t.string :name
      t.string :category
      t.text :description
      t.text :short_description
      t.string :video_url_code

      t.timestamps
    end
  end
end
