module Importable
  require 'roo'

  extend ActiveSupport::Concern

  module ClassMethods
    def import(file)
      spreadsheet = open_spreadsheet(file)
      header = spreadsheet.row(1)
      (2..spreadsheet.last_row).each do |i|
        row = Hash[[header, spreadsheet.row(i)].transpose]

        User.create(first_name: row['Nombre'],
                    last_name: row['Apellido'],
                    generation: row['Generacion'],
                    email: row['Email'],
                    password: Digest::MD5.hexdigest(row['Nombre']))
      end
    end

    def open_spreadsheet(file)
      case File.extname(file.original_filename)
      when '.csv' then Roo::Spreadsheet.open(file.path, extension: :csv)
      when '.xls' then Roo::Spreadsheet.open(file.path, extension: :xls)
      when '.xlsx' then Roo::Spreadsheet.open(file.path, extension: :xlsx)
      else raise "Extensión de archivo no soportada: #{file.original_filename}"
      end
    end
  end
end
