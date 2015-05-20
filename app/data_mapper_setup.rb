env = ENV['RACK_ENV'] || 'development'

DataMapper.setup(:default, "postgres://localhost/bookmark_manager_#{env}")

require_relative '../lib/tag'
require_relative '../lib/user'
require_relative '../lib/link'

DataMapper.finalize

DataMapper.auto_upgrade!