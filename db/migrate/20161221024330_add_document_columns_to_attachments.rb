class AddDocumentColumnsToAttachments < ActiveRecord::Migration[5.0]
  def up
    add_attachment :attachments, :document
  end

  def down
    remove_attachment :attachments, :document
  end
end
