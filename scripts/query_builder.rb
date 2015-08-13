require 'uri'

class QueryBuilder
  def build(options)
    options[:scheme] + "://www." + options[:hostname] + 
    options[:path] + URI.encode_www_form(options[:params])
  end

  def valid_date? file, date
    file.each_line do |line|
      if line.index("Fund Holdings as of")
        day_idx = line.index(date.day.to_s)
        year_idx = line.index(date.year.to_s)
        if day_idx && year_idx && day_idx != year_idx
          return true
        end
      end
    end
    return false
  end
end
