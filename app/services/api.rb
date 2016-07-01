require 'net/http'
require 'json'

class API
  def self.get(url_string)
    uri = URI(url_string)
    response = Net::HTTP.get(uri)
    bill_json = JSON.parse(response)
  rescue Exception
    nil
  end
end
