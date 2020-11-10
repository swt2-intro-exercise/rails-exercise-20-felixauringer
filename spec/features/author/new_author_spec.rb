require 'rails_helper'

describe 'New author page', type: :feature do
  it 'should render withour error' do
    visit new_author_path
  end

  describe 'input fields' do
    before { visit new_author_path }

    it 'has a first_name input field' do
      expect(page).to have_field('author[first_name]')
    end

    it 'has a last_name input field' do
      expect(page).to have_field('author[last_name]')
    end

    it 'has a homepage input field' do
      expect(page).to have_field('author[homepage]')
    end
  end
end
