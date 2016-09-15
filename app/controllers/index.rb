get '/' do
  redirect "/urls"
end

get '/session-viewer' do
  session.inspect
end
