require 'rails_helper'

RSpec.describe 'papers/edit', type: :view do
  let(:authors) { FactoryBot.create_list :author, 5 }

  before(:each) do
    @paper = assign(:paper, Paper.create!(
                              title: 'Great Paper',
                              venue: 'sample venue',
                              year: 1429
                            ))
    @authors = assign(:authors, authors)
  end

  it 'renders the edit paper form' do
    render

    assert_select 'form[action=?][method=?]', paper_path(@paper), 'post' do
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
