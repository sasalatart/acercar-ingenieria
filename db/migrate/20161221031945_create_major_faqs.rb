class CreateMajorFaqs < ActiveRecord::Migration[5.0]
  def change
    create_table :major_faqs do |t|
      t.string :question
      t.text :answer
      t.references :major, foreign_key: true

      t.timestamps
    end
  end
end
