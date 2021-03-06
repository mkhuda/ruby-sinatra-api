require "sinatra"
require "indofix"
require "json"
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

  get '/indofix_sample' do
    return Indofix.check('nomina', 'menggemaskan')
  end

  get '/indofix_nomina_only' do
    my_hash = Hash.new
    my_hash['nomina_1'] = Indofix.check('nomina', 'melakukan')
    my_hash['nomina_2'] = Indofix.check('nomina', 'menjanjikan')
    my_hash['nomina_3'] = Indofix.check('nomina', 'meragukan')
    return JSON(my_hash)
  end

  get '/indofix_verba_only' do
    verba_hash = Hash.new
    verba_hash['verba_1'] = Indofix.check('verba', 'andaikan')
    verba_hash['verba_1'] = Indofix.check('verba', 'andaikan')
    verba_hash['verba_2'] = Indofix.check('verba', 'menjalani')
    verba_hash['verba_3'] = Indofix.check('verba', 'kerjakanlah')
    return JSON(verba_hash)
  end

  get '/indofix_kpst_only' do
    kpst_hash = Hash.new 
    kpst_hash['kpst_1'] = Indofix.check('kpst', 'nurut')
    return JSON(kpst_hash)
  end

  get '/indofix_other_only' do
    other_hash = Hash.new
    other_hash['other_1'] = Indofix.check('other', 'berjalan')
  end

end
