class PapersController < ApplicationController
  before_action :set_paper, only: %i[show edit update destroy]
  before_action :set_authors, only: %i[new edit]

  # GET /papers
  def index
    @papers = Paper.all
  end

  # GET /papers/1
  def show; end

  # GET /papers/new
  def new
    @paper = Paper.new
  end

  # GET /papers/1/edit
  def edit; end

  # POST /papers
  def create
    @paper = Paper.new(paper_params)

    if @paper.save
      redirect_to @paper, notice: 'Paper was successfully created.'
    else
      set_authors
      render :new
    end
  end

  # PATCH/PUT /papers/1
  def update
    if @paper.update(paper_params)
      redirect_to @paper, notice: 'Paper was successfully updated.'
    else
      set_authors
      render :edit
    end
  end

  # DELETE /papers/1
  def destroy
    @paper.destroy
    redirect_to papers_path, notice: 'Paper was successfully destroyed.'
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_paper
    @paper = Paper.find(params[:id])
  rescue ActiveRecord::RecordNotFound
    not_found
  end

  def set_authors
    @authors = Author.all
  end

  # Only allow a trusted parameter "white list" through.
  def paper_params
    params.require(:paper).permit(:title, :venue, :year, author_ids: [])
  end
end
