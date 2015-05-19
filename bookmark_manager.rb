require 'sinatra/base'
require 'data_mapper'

class BookmarkManager < Sinatra::Bas
  e
  get '/' do
    'Hello BookmarkManager!'
  end

env = ENV['RACK_ENV'] || 'development'

DataMapper.setup(:default, "postgres://localhost/bookmark_manager_#{env}")

require './lib/link'

DataMapper.finalize

DataMapper.auto_upgrade!

# start the server if ruby file executed directly
  run! if app_file == $0
end
