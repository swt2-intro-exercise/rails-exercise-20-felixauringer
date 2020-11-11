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
    expect(page).to have_text(author.homepage)
  end
end
