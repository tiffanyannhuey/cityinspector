post '/cities' do
# puts params
# "https://api.teleport.org/api/urban_areas/slug:#{params[:city]}/scores/"
  response = params[:city]
  response.gsub!(/ /, '-')
  response = HTTParty.get("https://api.teleport.org/api/urban_areas/slug:#{response}/scores/")
  # response.parsed_response
  # list = erb :'/cities/show-partial', layout: false
  content_type :json
  {data: response}.to_json
end