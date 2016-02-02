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
  erb :"/horses/show"
end