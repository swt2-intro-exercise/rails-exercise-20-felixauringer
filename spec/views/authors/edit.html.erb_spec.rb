require 'rails_helper'

RSpec.describe 'authors/edit', type: :view do
  let(:author) { FactoryBot.create :author }

  before do
    assign(:author, author)
    render
  end

  it 'has a link to the index page' do
    expect(rendered).to have_link('Back', href: authors_path)
  end

  it 'has a link to the show page' do
    expect(rendered).to have_link('Show author', href: author_path(author))
  end
end
