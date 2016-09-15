get '/sessions/new' do
  erb :'/sessions/new'
end

post '/sessions' do
  @user = User.find_by(email: params[:email])
  if @user
    if @user.authenticate(params[:password])
       session[:user_id] = @user.id
       redirect '/urls'
    else
      @errors = ["Wrong Email or Password"]
      erb :'/sessions/new'
    end
  else
    @errors = ["Wrong Email or Password"]
    erb :'/sessions/new'
  end
end

delete '/sessions' do
  if session[:user_id]
    session.delete(:user_id)
    redirect '/urls'
  end
end

