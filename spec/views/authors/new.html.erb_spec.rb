require 'rails_helper'

RSpec.describe 'authors/new', type: :view do
  let(:author) { Author.new }

  before do
    assign(:author, author)
    render
  end

  it 'has a link to the index page' do
    expect(rendered).to have_link('Back', href: authors_path)
  end
end
