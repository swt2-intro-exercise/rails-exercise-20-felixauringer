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
end
