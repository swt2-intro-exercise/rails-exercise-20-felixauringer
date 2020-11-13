class PapersController < ApplicationController
  before_action :set_paper, only: %i[show edit update destroy]
  before_action :set_authors, only: %i[new edit]

  def index
    @papers = Paper.all

    @papers = @papers.published_in params[:year] unless params[:year].blank?
  end

  def show; end

  def new
    @paper = Paper.new
  end

  def edit; end

  def create
    @paper = Paper.new paper_params

    if @paper.save
      redirect_to(@paper, notice: 'Paper was successfully created.')
    else
      set_authors
      render :new
    end
  end

  def update
    if @paper.update paper_params
      redirect_to(@paper, notice: 'Paper was successfully updated.')
    else
      set_authors
      render :edit
    end
  end

  def destroy
    @paper.destroy
    redirect_to(papers_path, notice: 'Paper was successfully destroyed.')
  end

  private

  def set_paper
    @paper = Paper.find params[:id]
  rescue ActiveRecord::RecordNotFound
    not_found
  end

  def set_authors
    @authors = Author.all
  end

  def paper_params
    params.require(:paper).permit(:title, :venue, :year, author_ids: [])
  end
end
