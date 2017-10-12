require "mysql2"

class MyDatabase
 
  def initialize
      @client = Mysql2::Client.new(
      :host => "localhost",
      :username => "root",
      :password => "muhammad",
      :database => "sinatra"
      )
  end

  def select_all_komedian
    @hash = Hash.new
    @array = Array.new
    @query = @client.query("SELECT * FROM komedian ORDER BY id")
    @query.each do |a|
	@hash = {:id => a['id'], :nama => a['nama']}
	@array << @hash
    end
    return @array.to_json
  end

end
