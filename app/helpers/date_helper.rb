module DateHelper
  def human_created_at(model)
    l model.created_at, format: '%A %d de %B del %Y'
  end
end
