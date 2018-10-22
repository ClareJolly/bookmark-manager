require 'sinatra/base'
require_relative './lib/bookmarks'
require './database_connection_setup'
require 'sinatra/flash'
require 'uri'

# enable :sessions

class BookmarkManager < Sinatra::Base
  enable :sessions, :method_override
  register Sinatra::Flash

  get '/' do
    'Bookmark Manager'
  end

  get '/bookmarks' do
    @bookmarks = Bookmarks.all
    erb :bookmarks
  end

  get '/add-bookmark' do
    erb :add_bookmark
  end

  # post '/add-to-database' do
  #   Bookmarks.create(params[:url], params[:title])
  #   redirect '/bookmarks'
  # end

  post '/bookmarks' do
    flash[:notice] = "You must submit a valid URL." unless Bookmarks.create(params[:url], params[:title])
    redirect '/bookmarks'
  end

  delete '/bookmarks/:id' do
    Bookmarks.delete(id: params[:id])
    redirect '/bookmarks'
  end

  get '/bookmarks/:id/edit' do
    @bookmark = Bookmarks.find(params[:id])
    erb :edit
  end

  patch '/bookmarks/:id' do
    Bookmarks.update(params[:id], params[:url], params[:title])
    redirect('/bookmarks')
  end

  run! if app_file == $0
end
