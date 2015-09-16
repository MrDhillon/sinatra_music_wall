# Homepage (Root path)
get '/' do
  erb :index
end

get '/tracks' do
  raise if session[:user_id].nil?
  @tracks = Track.all
  erb :'tracks/index'
end

get '/tracks/new' do
  erb :'tracks/new'
end

get '/tracks/:id' do
  @track = Track.find params[:id]
  @review = Review.where(track_id: params[:id])
  erb :'tracks/show'
end

get '/:author/tracks' do
  @tracks = Track.where("author= ? ",params[:author])
  erb :'tracks/all_authors'
end

post '/tracks' do
  @track = Track.new(
    author: params[:author],
    title: params[:title],
    URL: params[:URL],
    user_id: session[:user_id]
    )
  if @track.save
    redirect '/tracks'
  else
    erb :'tracks/new'
  end
end

get '/user/new' do
  erb :'users/new'
end

get '/user/login' do
  erb :'users/login'
end

post '/users' do
  @user = User.new(
    username: params[:username],
    password: params[:password]
    )
  if @user.save
    session[:user_id] = @user.id
    redirect '/tracks'
  else
    erb :'/users/new'
  end
end

post '/users/login' do
  @user = User.find_by(
    username: params[:username],
    password: params[:password]
    )
  if @user
    session[:user_id] = @user.id
    redirect 'tracks'
  else
    erb :'users/login'
  end
end

get '/logout' do
  session[:user_id] = nil
  redirect '/'
end

post '/vote' do
  @vote = Vote.create(
    track_id: params[:track_id],
    user_id: session[:user_id],
    vote_count: 1
    )
  redirect '/tracks'
end

get '/reviews' do
  erb :'track/reviews'
end

post '/review' do
  @review = Review.create(
    track_id: params[:track_id],
    user_id: session[:user_id],
    review: params[:review]
    )
  redirect "/tracks/#{@review.track_id}"
end


