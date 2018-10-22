require 'sinatra/base'
require './lib/bookmarks'

class BookmarkManager < Sinatra::Base

  get '/' do
    "Hello World!"
  end

  get '/bookmarks' do
    # p ENV
    @bookmarks = Bookmarks.all
    erb :bookmarks
  end

  get '/add-bookmark' do
    erb :add_bookmark
  end

  post '/add-to-database' do
    Bookmarks.create(params[:url])
    redirect '/bookmarks'
  end

  run! if app_file == $0
end
