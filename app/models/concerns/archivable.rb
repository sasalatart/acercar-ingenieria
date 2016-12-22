module Archivable
  extend ActiveSupport::Concern

  ARCHIVED_STATUS = 'archived'.freeze
  UNARCHIVED_STATUS = 'unarchived'.freeze

  def toggle_archived_status
    if status == ARCHIVED_STATUS
      update_attributes(status: UNARCHIVED_STATUS)
      'Desarchivado'
    else
      update_attributes(status: ARCHIVED_STATUS)
      'Archivado'
    end
  end
end
