require 'bundler'
Bundler.require

require_relative 'connection'
require_relative 'models/school'
require_relative 'models/user'

enable :sessions

get '/' do
  @schools = School.all
  erb :index
end

get '/users/new' do
  erb :'users/new'
end

post '/users' do
  user = User.new(params[:user])
  user.password = params[:password]
  user.save!
  redirect "/profiles"
end

get '/profiles' do
  if session[:current_user]
    @user = User.find(session[:current_user])
    erb :'profiles/index'
  else 
    redirect '/'
  end
end

get '/sessions/new' do
  erb :'sessions/new'
end

post '/sessions' do
  user = User.find_by({username: params[:username]})
  if user != nil && user.password == params[:password]
    session[:current_user] = user.id 
    redirect '/profiles'
  else
    redirect '/users/new'
  end
end

delete '/sessions' do
  session[:current_user] = nil
  redirect '/users/new'
end