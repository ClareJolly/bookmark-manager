require 'sinatra/base'
require './lib/bookmarks'

class BookmarkManager < Sinatra::Base



  get '/' do
    "Hello World!"
  end

  get '/bookmarks' do
    @bookmarks = Bookmarks.all
    erb :bookmarks
  end

  run! if app_file == $0
end
