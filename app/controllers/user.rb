# get user form
get '/users/new' do
  erb :"/users/new_user"
end

# save new user from completed form
post '/users' do
  user = User.new(name: params[:name], email: params[:email])
  user.password = params[:password]

  if user.save
    session[:id] = user.id
    redirect '/'
  else
    @errors = user.errors.full_messages
    erb :"users/new"
  end
end

# show one user (profile)
get '/users/:id' do
  @user = User.find(params[:id])
  erb :"/users/profile"
end

# edit one user (profile)
get '/users/:id/edit' do
  @user = User.find(params[:id])
  erb :"/users/edit_user"
end

# update user attributes from completed form
put '/users/:id/edit' do
  user = User.find(params[:id])
  user.update_attributes(params)

  if user.save
    redirect
  else
    redirect "/users/#{current_user.id}/edit"
  end
end

# delete a user and their horses
delete '/users/:id' do
  User.find(params[:id]).destroy
  current_user = nil
  session[:id] = nil
  redirect '/'
end
