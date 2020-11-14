require 'rails_helper'
require 'support/form_helpers'

describe 'Submitting the edit author form', type: :feature do
  let(:author) { FactoryBot.create(:author, :with_homepage) }

  before do
    visit edit_author_path(author)
    fill_in('author[first_name]', with: updated_author.first_name)
    fill_in('author[last_name]', with: updated_author.last_name)
    fill_in('author[homepage]', with: updated_author.homepage)
    submit_form
  end

  describe 'with valid attributes' do
    let(:updated_author) { FactoryBot.build(:author, :different) }

    it 'changes the first_name' do
      expect { author.reload }.to change(author, :first_name).from(author.first_name).to(updated_author.first_name)
    end

    it 'changes the last_name' do
      expect { author.reload }.to change(author, :last_name).from(author.last_name).to(updated_author.last_name)
    end

    it 'changes the first_name' do
      expect { author.reload }.to change(author, :homepage).from(author.homepage).to(updated_author.homepage)
    end
  end

  describe 'without valid attributes' do
    let(:updated_author) { Author.new }

    it 'does not change the author' do
      expect { author.reload }.not_to change(author, :hash)
    end

    it 'shows an error message' do
      expect(page).to have_text("First name can't be blank")
      expect(page).to have_text("Last name can't be blank")
    end
  end
end
