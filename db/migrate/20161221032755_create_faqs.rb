class CreateFaqs < ActiveRecord::Migration[5.0]
  def change
    create_table :faqs do |t|
      t.string :question
      t.string :answer
      t.boolean :frequent, default: false

      t.timestamps
    end
  end
end
