
#get form for new user
get '/users/new' do
erb :"/users/new"
end

#create new user
post '/users' do
puts params[:user].to_s
user = User.new(params[:user])
  if user.save
    session[:user_id] = user.id
    redirect '/'
  else
    @errors = user.errors.full_messages
    erb :"/users/new"
  end
end
