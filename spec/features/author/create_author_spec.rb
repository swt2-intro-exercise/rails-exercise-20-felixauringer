require 'rails_helper'
require 'support/form_helpers'

describe 'Submitting the new author form', type: :feature do
  before do
    visit new_author_path
    fill_in('author[first_name]', with: author.first_name)
    fill_in('author[last_name]', with: author.last_name)
    fill_in('author[homepage]', with: author.homepage)
  end

  describe 'with valid attributes' do
    let(:author) { FactoryBot.build :author, :with_homepage }

    it 'adds a new author to the database' do
      expect { submit_form }.to change(Author, :count).by(1)
      author_db = Author.last
      expect(author_db.first_name).to eq(author.first_name)
      expect(author_db.last_name).to eq(author.last_name)
      expect(author_db.homepage).to eq(author.homepage)
    end
  end

  describe 'with invalid attributes' do
    let(:author) { Author.new }

    it 'does not add the author to the database' do
      expect { submit_form }.not_to change(Author, :count)
    end

    it 'shows an error message' do
      submit_form
      expect(page).to have_text("First name can't be blank")
      expect(page).to have_text("Last name can't be blank")
    end
  end
end
