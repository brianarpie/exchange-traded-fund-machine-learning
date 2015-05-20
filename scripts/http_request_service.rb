require 'net/http'
require 'pry'

class HttpRequestService
  def get uri_str
    uri = URI(uri_str)

    Net::HTTP.start(uri.host, uri.port,
      :use_ssl => uri.scheme == 'https') do |http|
      request = Net::HTTP::Get.new uri
      (http.request request).body
    end
  end
end