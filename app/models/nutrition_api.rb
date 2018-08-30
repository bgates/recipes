module NutritionApi

  API_KEY = "xd3lcZXUCnNsCeNykVzdcozVqegIJQgARRPooPuE"
  API_BASE_URL = "https://api.nal.usda.gov/"

  def self.connection
    We::Call::Connection.new(
      host: API_BASE_URL,
      timeout: 5
    )
  end

  def self.search(food_name)
    search_response = connection.get "ndb/search/?format=json&q=#{food_name}&sort=n&ds=Standard%20Reference&max=500&offset=0&api_key=#{API_KEY}"
    search_json = JSON.parse(search_response.body)['list']
    { items: search_json['item'], start: search_json['start'], end: search_json['end'], total: search_json['total'] }
  end

  def self.find(id)
    search_response = connection.get "ndb/V2/reports?format=json&ndbno=#{id}&type=b&api_key=#{API_KEY}"
    search_json = JSON.parse(search_response.body)
  end

end