require "sinatra"
require_relative "my_db"

class App < Sinatra::Base
	get '/' do
		return "Hello from Sinatra.rb"
	end

	get '/show_komedian' do
		content_type :json
		@database = MyDatabase.new
		return @database.select_all_komedian
	end
end
