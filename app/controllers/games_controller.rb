require "json"
require "open-uri"

class GamesController < ApplicationController
  def new
    @letters = []
    10.times do
      range = ("A".."Z").to_a.sample
      @letters << range
    end
  end

  def score
    # @rand = params[:rand]
    # @value = params[:value]

    if !inclu
      @result = "Sorry but #{params[:value]} cannot be built out of #{params[:rand]}"
    elsif pars == false
      @result = "Sorry but #{params[:value]} does not seem to be a valid English word"
    else
      @result = "Congratulations ! #{params[:value]} is a valid English word !"
    end
  end

  def inclu
    array = params[:value].split("")
    array.each do |item|
      params[:rand].include?(item)
    end

  end

  def pars
    url = "https://wagon-dictionary.herokuapp.com/#{params[:value]}"
    word_serialized = URI.open(url).read
    word = JSON.parse(word_serialized)
    word["found"]
    end
end
