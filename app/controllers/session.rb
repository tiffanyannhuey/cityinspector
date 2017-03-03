#check session hash
get '/inspect' do
  session.inspect
end

#get login page
get '/login' do
  erb :'login'
end

# post login form
post '/login' do
  @user = User.find_by_email(params[:email])
  if @user && @user.authenticate(params[:password])
    session[:user_id] = @user.id
    redirect '/'
  else
    @errors = ["Sorry, the credentials do not match."]
   erb :login
  end
end

#log out
get '/logout' do
  session[:user_id] = nil
  redirect '/login'
end
