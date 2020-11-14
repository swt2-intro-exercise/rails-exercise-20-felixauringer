require 'rails_helper'

RSpec.describe 'authors/index', type: :view do
  let(:authors) { FactoryBot.create_list(:author, 5, :with_homepage) }

  before do
    assign(:authors, authors)
    render
  end

  it 'renders a list of authors' do
    authors.each do |author|
      assert_select('tr>td', text: author.name)
      assert_select('tr>td', text: author.homepage)
    end
  end

  it 'renders links for all authors' do
    authors.each do |author|
      expect(rendered).to have_link('Show', href: author_path(author))
      expect(rendered).to have_link('Edit', href: edit_author_path(author))
      expect(rendered).to have_link('Delete', href: author_path(author))
    end
  end

  it 'renders a link to the new author page' do
    expect(rendered).to have_link('New author', href: new_author_path)
  end

  it 'renders a link to the homepage' do
    expect(rendered).to have_link('Homepage', href: root_path)
  end
end
