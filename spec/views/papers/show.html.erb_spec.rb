require 'rails_helper'

RSpec.describe 'papers/show', type: :view do
  let(:paper) { FactoryBot.create(:paper, :with_authors) }

  before do
    assign(:paper, paper)
    render
  end

  it 'renders the paper attributes' do
    render
    expect(rendered).to have_text(paper.title)
    expect(rendered).to have_text(paper.venue)
    expect(rendered).to have_text(paper.year)
  end

  it 'renders the list of associated authors' do
    paper.authors.each do |author|
      expect(rendered).to have_text(author.name)
    end
  end

  it 'renders a link to the index page' do
    expect(rendered).to have_link('Back', href: papers_path)
  end

  it 'renders a link to the edit page' do
    expect(rendered).to have_link('Edit paper', href: edit_paper_path(paper))
  end

  it 'renders a link for deleting the paper' do
    expect(rendered).to have_link('Delete paper', href: paper_path(paper))
  end
end
