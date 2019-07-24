
require 'pg' # - use gem install pg
require 'sinatra'
require 'sinatra/reloader' if development?
require './methods.rb'

#Security - (re)move (conn) connection into separate file

# 404 Error!
error Sinatra::NotFound do
  @title = "Nothing here... move along please"
  erb :oops, :layout => :page404
end

#ALL CATEGORIES - HOME PAGE
get '/' do
		@title = "Postgres - Ruby Polish Language App Port" 
    erb :'home', :layout => :categories_layout
end

#LIST CATEGORY ITEMS
get '/:category' do
	@title = params[:category].capitalize
  @rows = category(params[:category].capitalize)
  erb :category, :layout => :subcat_layout
end

#CATEGORY DETAIL
get '/:category/:thing' do
  @title = params[:thing]
  @rows = detail(params[:thing].capitalize)
  erb :detail, :layout => :detail_layout
end