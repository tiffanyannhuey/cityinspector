get '/' do
  redirect '/login' unless current_user
end
