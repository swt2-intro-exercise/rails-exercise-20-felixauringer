class AuthorsController < ApplicationController
  def index
    @authors = Author.all
  end

  def show
    @author = Author.find(params[:id])
  rescue ActiveRecord::RecordNotFound
    not_found
  end

  def new
    @author = Author.new
  end

  def edit
    @author = Author.find(params[:id])
  rescue ActiveRecord::RecordNotFound
    not_found
  end

  def create
    @author = Author.new(author_params)

    return render :new unless @author.save

    redirect_to @author
  end

  def update
    @author = Author.find(params[:id])

    return render :edit unless @author.update(author_params)

    redirect_to @author
  rescue ActiveRecord::RecordNotFound
    not_found
  end

  def destroy
    @author = Author.find(params[:id])
    @author.destroy
    redirect_to authors_path
  rescue ActiveRecord::RecordNotFound
    not_found
  end

  private

  def author_params
    params.require(:author).permit(:first_name, :last_name, :homepage)
  end
end
