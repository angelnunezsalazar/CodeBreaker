require 'rubygems' if RUBY_VERSION < '1.9'
require 'sinatra'
require "lib/game"

configure do
  set :views, "#{File.dirname(__FILE__)}/views"
end

get "/" do
	@@cb = CodeBreaker.new
	erb :codebreaker
end

get "/jugar" do
	@conjetura = params[:conjetura]
	@resultado = @@cb.try_with(@conjetura)
	@resultado = "El resultado de su ultima jugada ("+@conjetura+") es: " + @resultado
  erb :codebreaker
end
