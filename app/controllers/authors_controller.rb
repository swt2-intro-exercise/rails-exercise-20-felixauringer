class AuthorsController < ApplicationController
  before_action :set_author, only: %i[show edit update destroy]

  def index
    @authors = Author.all
  end

  def show; end

  def new
    @author = Author.new
  end

  def edit; end

  def create
    @author = Author.new(author_params)

    return render :new unless @author.save

    redirect_to @author
  end

  def update
    return render :edit unless @author.update(author_params)

    redirect_to @author
  end

  def destroy
    @author.destroy
    redirect_to authors_path
  end

  private

  def author_params
    params.require(:author).permit(:first_name, :last_name, :homepage)
  end

  def set_author
    @author = Author.find(params[:id])
  rescue ActiveRecord::RecordNotFound
    not_found
  end
end
