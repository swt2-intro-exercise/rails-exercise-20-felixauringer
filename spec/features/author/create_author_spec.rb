require 'rails_helper'

describe 'Submitting the new author form', type: :feature do
  let(:create_author) { click_button('commit') }

  before do
    visit new_author_path
    fill_in('author[first_name]', with: author.first_name)
    fill_in('author[last_name]', with: author.last_name)
    fill_in('author[homepage]', with: author.homepage)
  end

  describe 'with valid attributes' do
    let(:author) { FactoryBot.build :author, :with_homepage }

    it 'adds a new author to the database' do
      expect { create_author }.to change(Author, :count).from(0).to(1)
      author_db = Author.first
      expect(author_db.first_name).to eq(author.first_name)
      expect(author_db.last_name).to eq(author.last_name)
      expect(author_db.homepage).to eq(author.homepage)
    end
  end

  describe 'without first_name' do
    let(:author) { Author.new(last_name: 'Turing') }

    it 'does not add the author to the database' do
      expect { create_author }.not_to change(Author, :count)
    end

    it 'shows an error message' do
      create_author
      expect(page).to have_text("First name can't be blank")
    end
  end

  describe 'without last_name' do
    let(:author) { Author.new(first_name: 'Alan') }

    it 'does not add the author to the database' do
      expect { create_author }.not_to change(Author, :count)
    end

    it 'shows an error message' do
      create_author
      expect(page).to have_text("Last name can't be blank")
    end
  end
end
