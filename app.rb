require 'sinatra'
require 'sinatra/activerecord'
require './config/environments' #database configuration
require './models/model'        #Model class
 
get '/' do
	erb :index
end

get '/confirmed' do
  erb :confirm
end
 
post '/submit' do
	@model = Model.new(params[:model])
	if @model.save
		redirect '/confirmed'		
	else
		"Sorry, there was an error!"
	end
end
 
get '/models' do
	@models = Model.all
	erb :models
end