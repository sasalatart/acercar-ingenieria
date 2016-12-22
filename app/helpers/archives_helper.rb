module ArchivesHelper
  def archive_button(archivable, url)
    text = archivable.status == Archivable::UNARCHIVED_STATUS ? 'Archivar' : 'Desarchivar'
    extra_class = archivable.status == Archivable::UNARCHIVED_STATUS ? '' : 'green'

    link_to raw("<i class='fa fa-archive'></i> #{text}"),
            url,
            method: :put,
            class: "button-link button-inline #{extra_class}"
  end
end
