get '/urls' do
  @urls = Url.all
  erb :'/urls/index'
end
