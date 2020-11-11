class AuthorsController < ApplicationController
  # index

  def show
    @author = Author.find(params[:id])

  rescue ActiveRecord::RecordNotFound
    not_found
  end

  def new; end

  # edit

  def create
    @author = Author.new(author_params)

    return render :new unless @author.save

    redirect_to @author
  end

  # update

  # destroy

  private

  def author_params
    params.require(:author).permit(:first_name, :last_name, :homepage)
  end
end
