class Scoring
  LETTER_SCORING = {
    "A" => 1,
    "B" => 3,
    "C" => 3,
    "D" => 2,
    "E" => 1,
    "F" => 4,
    "G" => 2,
    "H" => 4,
    "I" => 1,
    "J" => 8,
    "K" => 5,
    "L" => 1,
    "M" => 3,
    "N" => 1,
    "O" => 1,
    "P" => 3,
    "Q" => 10,
    "R" => 1,
    "S" => 1,
    "T" => 1,
    "U" => 1,
    "V" => 4,
    "W" => 4,
    "X" => 8,
    "Y" => 4,
    "Z" => 10,
  }

  def self.score(word)
    word = word.upcase!
    word_array = word.split("") # could use .chars here 
    score_value = 0

    # applies 50 point bonus for words >= 7 letters
    amount_of_loops = word_array.length
     if amount_of_loops >= 7
       score_value +=50
     end
    word_array.each do |letter|
     LETTER_SCORING.each do |hash_letter, point_value|
       if hash_letter == letter
         score_value += point_value
       end
      end
    end
    return score_value.to_i
  end

  def self.highest_score_from(array_of_words)
    score_values_array = []

    array_of_words = array_of_words.map(&:upcase)
    array_of_words.each do |word_in_array|
      score_value = 0
      letter_array = word_in_array.split("")
      # checks for the 50 point bonus
      amount_of_loops = letter_array.length
  	   if amount_of_loops >= 7
  	     score_value +=50
  	   end

       #split each word into letters, scan and score each letter
  	   letter_array.each do |letter|
  	     LETTER_SCORING.each do |hash_letter, point_value|
  		     if hash_letter == letter
  		        score_value += point_value
  		     end
  		   end
  	   end
       # collects all of the scores for each word 
       score_values_array << score_value
     end

    # index of the highest scoring word = array of word values()
    high_value_index = score_values_array.index(score_values_array.max)

    # used to check for a tie
    tie_value_index =
     score_values_array.each_index.select {|i| score_values_array[i] == score_values_array.max}
    # tie_value_index holds the indexes of the highest score. if more than one, it's a tie
    if tie_value_index.length > 1 
      #can handle any number of words that are tied
      return tie_value_index.min{|a, b| a.size <=> b.size}
    else
      # returns the highest value word when there is no tie
      return array_of_words[high_value_index]
    end
  end
end
