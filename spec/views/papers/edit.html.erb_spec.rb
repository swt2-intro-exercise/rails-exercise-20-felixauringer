require 'rails_helper'

RSpec.describe 'papers/edit', type: :view do
  let(:authors) { FactoryBot.create_list(:author, 5) }
  let(:paper) { FactoryBot.create :paper }

  before do
    assign(:paper, paper)
    assign(:authors, authors)
    render
  end

  it 'has a link to the index page' do
    expect(rendered).to have_link('Back', href: papers_path)
  end

  it 'has a link to the show page' do
    expect(rendered).to have_link('Show paper', href: paper_path(paper))
  end
end
