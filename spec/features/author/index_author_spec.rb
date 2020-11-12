require 'rails_helper'

describe 'Index author page', type: :feature do
  let(:author_count) { 10 }
  let!(:authors) { FactoryBot.create_list(:author, author_count, :with_homepage) }

  it 'renders without error' do
    visit authors_path
  end

  describe 'author table' do
    before { visit authors_path }

    it 'shows the author attributes' do
      expect(page).to have_text(authors[0].name)
      expect(page).to have_text(authors[0].homepage)
      expect(page).to have_text(authors[author_count - 1].name)
      expect(page).to have_text(authors[author_count - 1].homepage)
    end

    it 'has a show link for each author' do
      expect(page).to have_link('Show', href: author_path(authors[0]))
      expect(page).to have_link('Show', href: author_path(authors[author_count - 1]))
    end

    it 'has a edit link for each author' do
      expect(page).to have_link('Edit', href: edit_author_path(authors[0]))
      expect(page).to have_link('Edit', href: edit_author_path(authors[author_count - 1]))
    end

    it 'has a delete link for each author' do
      expect(page).to have_link('Delete', href: author_path(authors[0]))
      expect(page).to have_link('Delete', href: author_path(authors[author_count - 1]))
    end
  end

  it 'has a link to the new author page' do
    visit authors_path
    expect(page).to have_link('New author', href: new_author_path)
  end
end
