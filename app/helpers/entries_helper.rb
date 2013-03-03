module EntriesHelper
  def urls
    %w[Email Web].each do |type|
      yield accessor_for(type), type
    end
  end
  def accessor_for(type)
    "#{type.downcase}_addresses".intern
  end
  def url_class(url)
    url.class.name.tableize.singularize
  end
end
