require 'rails_helper'

describe 'Submitting the author form', type: :feature do
  let(:author) { FactoryBot.build :author, :with_homepage }
  let(:create_author) { click_button('commit') }

  before do
    visit new_author_path
    fill_in('author[first_name]', with: author.first_name)
    fill_in('author[last_name]', with: author.last_name)
    fill_in('author[homepage]', with: author.homepage)
  end

  describe 'with valid attributes' do
    it 'adds a new author to the database' do
      expect { create_author }.to change(Author, :count).from(0).to(1)
      author_db = Author.first
      expect(author_db.first_name).to eq(author.first_name)
      expect(author_db.last_name).to eq(author.last_name)
      expect(author_db.homepage).to eq(author.homepage)
    end
  end

  describe 'without first_name' do
    before { author.first_name = '' }

    it 'does not add the author to the database' do
      expect { create_author }.not_to change(Author, :count)
    end
  end

  describe 'without last_name' do
    before { author.last_name = '' }

    it 'does not add the author to the database' do
      expect { create_author }.not_to change(Author, :count)
    end
  end
end
