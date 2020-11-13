require 'rails_helper'

RSpec.describe 'authors/_form', type: :view do
  before do
    assign(:author, author)
    render
  end

  context 'without existing author' do
    let(:author) { Author.new }

    it 'renders the new author form' do
      assert_select('form[action=?][method=?]', authors_path, 'post') do
        assert_select('input[name=?]', 'author[first_name]')
        assert_select('input[name=?]', 'author[last_name]')
        assert_select('input[name=?]', 'author[homepage]')
        assert_select('input[name=?]', 'commit')
      end
    end
  end

  context 'with existing author' do
    let(:author) { FactoryBot.create(:author, :with_homepage) }

    it 'renders the edit author form' do
      assert_select('form[action=?][method=?]', author_path(author), 'post') do
        assert_select('input[name=?]', 'author[first_name]')
        assert_select('input[name=?]', 'author[last_name]')
        assert_select('input[name=?]', 'author[homepage]')
        assert_select('input[name=?]', 'commit')
      end
    end

    it 'renders the author attributes' do
      assert_select('input[value=?]', author.first_name)
      assert_select('input[value=?]', author.last_name)
      assert_select('input[value=?]', author.homepage)
    end
  end
end
