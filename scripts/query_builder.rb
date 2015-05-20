require 'uri'

class QueryBuilder
  def build(options)
    options[:scheme] + "://www." + options[:hostname] + 
    options[:path] + URI.encode_www_form(options[:params])
  end
end
