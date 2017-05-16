post '/cities' do
  @city = params[:city]
  @city.gsub!(/ /, '-')
  response = HTTParty.get("https://api.teleport.org/api/urban_areas/slug:#{@city}/scores/")
  # image = HTTParty.get("https://api.teleport.org/api/urban_areas/slug:#{city}/images/")
  widget = erb :"/cities/widget-partial", layout: false
  content_type :json
  {data: response, widget: widget }.to_json
end
