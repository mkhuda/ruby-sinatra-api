require "sinatra"
require "indofix"
require_relative "my_db"
require_relative "notification"

class App < Sinatra::Base
	get '/' do
		return "Hello from Sinatra.rb"
	end

	get '/show_komedian' do
		@noti = Notification.new
		return @noti
	end

  get '/sinatra_sample' do
    return "Hello sinatra sample"
  end

  get '/indofix_sample' do
    return Indofix.check('nomina', 'menggemaskan')
  end

  get '/indofix_nomina_only' do
    return 'test'
  end
end
