require 'rails_helper'

describe 'Edit author page', type: :feature do
  let(:author) { FactoryBot.create :author }

  it 'renders without error' do
    visit edit_author_path(author)
  end

  describe 'input fields' do
    before { visit edit_author_path(author) }

    it 'has a first_name input field' do
      expect(page).to have_field('author[first_name]')
    end

    it 'has a last_name input field' do
      expect(page).to have_field('author[last_name]')
    end

    it 'has a homepage input field' do
      expect(page).to have_field('author[homepage]')
    end

    it 'has a submit button' do
      expect(page).to have_button('commit')
    end
  end
end
