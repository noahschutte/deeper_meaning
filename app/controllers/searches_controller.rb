class SearchesController < ApplicationController

  def index
    @search = Search.new
    @searches = Search.all
  end

  def create
    word = params[:search][:word].strip
    @search = Search.new(word: word)
    @searches = Search.all

    if @search.save
      redirect_to @search
    else
      render 'index'
    end
  end

  def show
    @search = Search.new
    @searches = Search.all
    @word = Search.find(params[:id]).word

    also_response = HTTParty.get "https://wordsapiv1.p.mashape.com/words/#{@word}/also", headers:{ "X-Mashape-Key" => ENV['SECRET_KEY'], "Accept" => "application/json" }

    if also_response.code < 300 && JSON.parse(also_response.body)["also"].length != 0
      @also = JSON.parse(also_response.body)["also"][0]
    else
      @also = "No results found."
    end
  end

end
