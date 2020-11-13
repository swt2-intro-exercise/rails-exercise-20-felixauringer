require 'rails_helper'

RSpec.describe 'papers/new', type: :view do
  let(:authors) { FactoryBot.create_list :author, 5 }

  before(:each) do
    assign(:paper, Paper.new(
                     title: 'Great Paper',
                     venue: 'sample venue',
                     year: 1
                   ))
    @authors = assign(:authors, authors)
  end

  it 'renders new paper form' do
    render

    assert_select 'form[action=?][method=?]', papers_path, 'post' do
      assert_select 'input[name=?]', 'paper[title]'
      assert_select 'input[name=?]', 'paper[venue]'
      assert_select 'input[name=?]', 'paper[year]'
      assert_select 'select[name=?]', 'paper[author_ids][]' do
        assert_select 'option[value=?]', authors[0].id.to_s
        assert_select 'option[value=?]', authors[-1].id.to_s
      end
    end
  end
end
