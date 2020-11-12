require 'rails_helper'

describe 'Index author page', type: :feature do
  let(:author_count) { 10 }
  let!(:authors) { FactoryBot.create_list(:author, author_count, :with_homepage) }

  it 'renders without error' do
    visit authors_path
  end

  it 'shows the existing authors' do
    visit authors_path
    expect(page).to have_text(authors[0].name)
    expect(page).to have_text(authors[0].homepage)
    expect(page).to have_link('Show author', href: author_path(authors[0]))
    expect(page).to have_text(authors[author_count - 1].name)
    expect(page).to have_text(authors[author_count - 1].homepage)
    expect(page).to have_link('Show author', href: author_path(authors[author_count - 1]))
  end

  it 'has a link to the new author page' do
    visit authors_path
    expect(page).to have_link('New author', href: new_author_path)
  end
end
