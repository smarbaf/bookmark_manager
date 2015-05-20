require 'sinatra/base'
require 'data_mapper'

class BookmarkManager < Sinatra::Base
  # get '/' do
  #   'Hello BookmarkManager!'
  # end

  get '/' do
    @links = Link.all
    erb :index
  end

  post '/links' do
    url = params['url']
    title = params['title']
    Link.create(url: url, title: title)
    redirect to('/')
  end

env = ENV['RACK_ENV'] || 'development'

DataMapper.setup(:default, "postgres://localhost/bookmark_manager_#{env}")

require './lib/link'

DataMapper.finalize

DataMapper.auto_upgrade!

# start the server if ruby file executed directly
  run! if app_file == $0
end
