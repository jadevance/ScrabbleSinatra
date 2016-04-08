require 'sinatra'
require_relative './lib/scoring.rb'

class Scrabble < Sinatra::Base

	get '/score' do 
		erb :score
	end

  post '/score' do
    @word = params["word"]
    @score = Scoring.score(params["word"])
    erb :score
  end
	
	get '/' do 
		erb :index
	end 
	get '/score-many' do 
		erb :score_many
	end 

	get '/score' do 
		erb :score
	end 

	run! 
end