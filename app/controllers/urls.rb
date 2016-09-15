get '/urls' do
  if logged_in?
    @user = User.find(session[:user_id])
  end
  @urls = Url.all
  erb :'/urls/index'
end

get '/urls/:short_url' do
  @url = Url.find_by(short_url: params[:short_url])
  @url.counter += 1
  @url.save
  redirect "#{@url.long_url}"
end
