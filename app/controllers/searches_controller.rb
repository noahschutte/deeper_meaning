class SearchesController < ApplicationController

  def index
    @search = Search.new
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
    @word = Search.find(params[:id]).word
  end

end
