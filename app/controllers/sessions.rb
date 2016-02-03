get '/login' do
  erb :"/sessions/login"
end

post '/sessions' do
  user = User.find_by(email: params[:email])
  if user && user.authentiate(params[:email], params[:password])
    session[:id] = user.id
    redirect '/'
  else
    status 400
    @errors = "Your username or password is incorrect. Please try again"
    erb :'/sessions/login'
  end
end

delete 'sessions/:id' do
  current_user = nil
  session[:id] = nil
  redirect '/'
end

get 'session-vewer' do
  session.inspect
end
