post '/cities' do
  response = params[:city]
  response.gsub!(/ /, '-')
  response = HTTParty.get("https://api.teleport.org/api/urban_areas/slug:#{response}/scores/")
  content_type :json
  {data: response}.to_json
end
