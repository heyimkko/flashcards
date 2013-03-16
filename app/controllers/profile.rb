get '/' do
  erb :index
end

get "/login" do
  erb :login
end

get "/signup" do
  @user = User.new
  erb :signup
end

# session creation (i.e. login) and closing session (logout)

# get '/session/new' do
#   @email = nil
#   erb :login
# end

post '/session' do    # login
    @user = User.find_by_email(params[:user]["email"])
  if User.authenticate(params[:user])
     p 'authenticated!!!'
     session[:id] = @user.id
     erb :profile
  else
     p 'bounced!!!!'
     @error = "You need a proper email and password"
     erb :login
  end
end 

get '/session/:id' do
  session.clear
  redirect '/'
end

# user page (profile) and new user routes

post '/user' do   # signup
  @user = User.new(params[:user])
    unless @user.save
      erb :signup
    else
      session[:id] = @user.id
      erb :profile
    end
end

get '/user'  do  #profile
  unless session[:id] = nil
    @user = User.find(session[:id])
    erb :profile
  else
    erb :index
  end
end
