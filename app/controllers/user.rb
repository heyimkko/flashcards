before '/' do
  current_user
  if session[:id]
    redirect "/profile/#{@user.id}"
   else
    erb :index
  end
end

get '/' do
 unless session[:id] == nil
    @user = User.find(session[:id])
    @decks = Deck.all
    erb :profile
  else
    erb :index
  end
end

get "/login" do
  erb :login
end

get "/signup" do
  @user = User.new
  erb :signup
end

post '/session' do    # login
    @user = User.find_by_email(params[:user]["email"])
  if User.authenticate(params[:user])
     p 'authenticated!!!'
     session[:id] = @user.id
     @decks = Deck.all
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

get '/profile/:id' do
  @user = User.find(params[:id])
  @decks = Deck.all
  erb :profile
end

post '/user' do   # signup
  @user = User.new(params[:user])
  @decks = Deck.all
    unless @user.save
      erb :signup
    else
      session[:id] = @user.id
      redirect "/profile/#{@user.id}"
    end
end
