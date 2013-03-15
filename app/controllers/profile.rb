
get '/' do
  erb :index
end

get "/login" do
  erb :login
end

get "/signup" do
  erb :signup
end

# session creation (i.e. login) and closing session (logout)

post '/session/new' do    # login
  if User.authenticate(user[:email], user[:password])
     p 'authenticated!!!'
     @user = User.find_by_email(user[:email])
     session[:id] = @user.id
     erb :profile
  else
     p 'bounced!!!!'
     erb :index
  end
end 

get '/session' do
  session.clear
  redirect '/'
end

# user page (profile) and new user routes

post '/user/new' do   # signup
  @user = User.new(params[:user])
    unless @user.save
      erb :index
    else
      session[:id] = @user.id
      erb :profile  
    end
end

get '/user'  do  #profile
  unless session[:id] = nil
    erb :profile
  else
    erb :index
  end
end
