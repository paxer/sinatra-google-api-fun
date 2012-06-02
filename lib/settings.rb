class Settings
  def self.google_api_key
    ENV['GOOGLE_API_KEY']
  end

  def self.product_search_url
    "https://www.googleapis.com/shopping/search/v1/public/products"
  end
end