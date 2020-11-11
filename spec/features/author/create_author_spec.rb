require 'rails_helper'

describe 'Submitting the author form', type: :feature do
  let(:author) { FactoryBot.build :author, :with_homepage }

  before do
    visit new_author_path
    fill_in('author[first_name]', with: author.first_name)
    fill_in('author[last_name]', with: author.last_name)
    fill_in('author[homepage]', with: author.homepage)
  end

  it 'adds a new author to the database' do
    expect { click_button('commit') }.to change(Author, :count).from(0).to(1)
    author_db = Author.first
    expect(author_db.first_name).to eq(author.first_name)
    expect(author_db.last_name).to eq(author.last_name)
    expect(author_db.homepage).to eq(author.homepage)
  end
end
