require 'rails_helper'

describe 'Show author page', type: :feature do
  let(:author) { FactoryBot.create :author, :with_homepage }

  it 'renders without error' do
    visit author_path(author)
  end

  it 'shows the author attributes' do
    visit author_path(author)
    expect(page).to have_text(author.first_name)
    expect(page).to have_text(author.last_name)
  end

  it 'shows a headline' do
    visit author_path(author)
    expect(page).to have_css('h1', text: author.name)
  end

  describe 'author with homepage' do
    it 'shows the homepage' do
      visit author_path(author)
      expect(page).to have_text(author.homepage)
    end
  end

  describe 'author without homepage' do
    let(:author) { FactoryBot.create :author }

    it 'does not show a homepage' do
      visit author_path(author)
      expect(page).not_to have_text('Homepage')
    end
  end

  it 'has a link to the index page' do
    visit author_path(author)
    expect(page).to have_link('Back', href: authors_path)
  end

  it 'has a link to the edit page' do
    visit author_path(author)
    expect(page).to have_link('Edit author', href: edit_author_path(author))
  end

  it 'removes the author from the database' do
    visit author_path(author)
    expect(page).to have_link('Delete author', href: author_path(author))
  end
end
