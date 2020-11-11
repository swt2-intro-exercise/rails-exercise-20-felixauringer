class AuthorsController < ApplicationController
  # index

  def show
    @author = Author.find(params[:id])
  end

  def new; end

  # edit

  def create
    Author.new(author_params).save
  end

  # update

  # destroy

  private

  def author_params
    params.require(:author).permit(:first_name, :last_name, :homepage)
  end
end
