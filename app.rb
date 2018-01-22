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
    my_hash = Hash.new
    my_hash['nomina_1'] = Indofix.check('nomina', 'melakukan')
    my_hash['nomina_2'] = Indofix.check('nomina', 'menjanjikan')
    my_hash['nomina_3'] = Indofix.check('nomina', 'meragukan')
    return my_hash
  end

  get '/indofix_verba_only' do
    verba_hash = Hash.new
    verba_hash['verba_1'] = Indofix.check('verba', 'andaikan')
    return verba_hash
  end
end
