get '/' do
  redirect '/login' unless current_user
  erb :index
end


