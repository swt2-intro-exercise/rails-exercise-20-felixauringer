class AuthorsController < ApplicationController
  def new; end

  def create
    Author.new(author_params).save
  end

  private

  def author_params
    params.require(:author).permit(:first_name, :last_name, :homepage)
  end
end
