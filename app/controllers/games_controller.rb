class GamesController < ApplicationController

  def scrape_api(word)
    require 'json'
    require 'open-uri'
    url = "https://wagon-dictionary.herokuapp.com/#{word}"
    # user_serialized = open(url).read
    user = JSON.parse(open(url).read)
    return user['found']
  end

  def new
    # @letters = ('a'..'z').to_a.last(10)

    @letters = (0...10).map { ('a'..'z').to_a[rand(26)] }
  end

  def score
   @guessed_word = params[:word].downcase
   @guessed_letters = @guessed_word.split('')
   @letters = params[:letters].split(' ')
   @good_guess = true
   @guessed_letters.each do |guessed_letter|
     letter_index = @letters.index(guessed_letter)
     if letter_index.nil?
       @good_guess = false
     else
       @letters.delete_at(letter_index)
     end
   end
   @english_guess = scrape_api(@guessed_word)
      if @good_guess && @english_guess
        @message = "Congratulations"
      elsif @english_guess == false
        @message = "Some other thing"
      else
        @message = "try again"
      end
  end
end
