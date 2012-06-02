require_relative '../settings'
require 'rest-client'
require 'active_support/json'
require 'cgi'

class Products
  attr_accessor :id, :title, :image, :price, :link

  def initialize params = {}
    params.keys.each do |key|
      self.send("#{key}=", params[key]) if self.respond_to? "#{key}="
    end
  end

  def self.search keywords
    products = []
    begin
      params = {:params => {:q       => CGI.escape(keywords),
                            :alt     => 'json',
                            :key     => Settings.google_api_key,
                            :rankBy  => 'price:ascending',
                            :country => 'US'}}

      response = RestClient.get "#{Settings.product_search_url}", params

      ActiveSupport::JSON.decode(response)["items"].each do |item|
        product = new(:id    => item["product"]["googleId"],
                      :title => item["product"]["title"],
                      :price => item["product"]["inventories"].first["price"],
                      :link  => item["product"]["link"],
                      :image => item["product"]["images"].first["link"])
        products << product
      end
    rescue RestClient::Exception => e
      raise e.inspect
    end
    products
  end
end