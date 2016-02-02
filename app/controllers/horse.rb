get '/horses' do
  @horses = Horse.all
  erb :"/horses/index"
end

get '/horses/new' do
  @horse = Horse.new

  if request.xhr?
    erb :"/horses/new", layout: false
  else
    erb :"/horses/new"
  end
end

post '/horses' do
  @horse = Horse.new(params[:horse])

  if @horse.save
    if request.xhr?
      erb :"/partials/_show_horse", layout: false, locals: {horse: @horse}
    else
      redirect '/horses'
    end
  else
    redirect '/horses/new'
  end

end

get '/horses/:id' do
  @horse = Horse.find(params[:id])

  if request.xhr?
    erb :"/partials/_horse_details", layout: false
  else
    erb :"/horses/show"
  end
end

get '/horses/:id/edit' do
  @horse = Horse.find(params[:id])
  erb :"/horses/edit"
end

put '/horses/:id' do
  @horse = Horse.find(params[:id])
  @horse.update_attributes(params[:horse])
  redirect '/horses'
end

delete '/horses/:id' do
  horse = Horse.find(params[:id])
  horse.destroy
  redirect '/horses'
end
