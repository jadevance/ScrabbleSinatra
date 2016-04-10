require 'sinatra'
require_relative './lib/scoring.rb'

class Scrabble < Sinatra::Base		
	
	def get_score(word)
		score = Scoring.score(word)
	end

	def get_scores(words)
		scores_array = []
		words.each do |word|
			result = Scoring.score(word)
			scores_array << result
		end
		return scores_array
	end

	get '/' do 
		erb :index
	end 

	get '/score' do 
		erb :score
	end

  post '/score' do
    @word = params["word"]
    @score = get_score(params["word"])
    erb :score
  end
	
	get '/score-many' do 
		erb :score_many
	end 

	post '/score-many' do
		words = []
		params['number'].to_i.times do |i|
			words << params["word-#{i}"]
		end
		if params.has_key? 'words'
			@scores = []
			@scores = get_scores(words)
			@final_result = words.zip(@scores)
		end 

		erb :score_many
	end 

 
	run! 
end