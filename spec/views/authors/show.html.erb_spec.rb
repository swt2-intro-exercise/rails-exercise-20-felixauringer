require 'rails_helper'

RSpec.describe 'authors/show', type: :view do
  let(:author) { FactoryBot.create :author }

  before do
    assign(:author, author)
    render
  end

  it 'renders the author attributes' do
    expect(rendered).to have_text(author.first_name)
    expect(rendered).to have_text(author.last_name)
  end

  it 'renders a headline' do
    expect(rendered).to have_css('h1', text: author.name)
  end

  context 'author with homepage' do
    let(:author) { FactoryBot.create(:author, :with_homepage) }

    it 'renders the homepage section' do
      expect(rendered).to have_text('Homepage')
      expect(rendered).to have_text(author.homepage)
    end
  end

  context 'author without homepage' do
    it 'does not render the homepage section' do
      expect(rendered).not_to have_text('Homepage')
    end
  end

  it 'renders a link to the index page' do
    expect(rendered).to have_link('Back', href: authors_path)
  end

  it 'renders a link to the edit page' do
    expect(rendered).to have_link('Edit author', href: edit_author_path(author))
  end

  it 'renders a link for deleting the author' do
    expect(rendered).to have_link('Delete author', href: author_path(author))
  end
end
