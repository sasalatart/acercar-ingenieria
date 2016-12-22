class AddLogoColumnsToMajors < ActiveRecord::Migration[5.0]
  def up
    add_attachment :majors, :logo
  end

  def down
    remove_attachment :majors, :logo
  end
end
