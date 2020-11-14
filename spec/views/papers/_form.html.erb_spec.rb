require 'rails_helper'

RSpec.describe 'papers/_form', type: :view do
  let(:authors) { FactoryBot.create_list(:author, 5) }
  let(:paper) { Paper.new }
  before do
    assign(:paper, paper)
    assign(:authors, authors)
    render
  end

  context 'without existing paper' do
    it 'renders the new paper form' do
      assert_select 'form[action=?][method=?]', papers_path, 'post' do
        assert_select 'input[name=?]', 'paper[title]'
        assert_select 'input[name=?]', 'paper[venue]'
        assert_select 'input[name=?]', 'paper[year]'
        assert_select 'select[name=?]', 'paper[author_ids][]'
      end
    end

    it 'renders the select author field with the correct options' do
      expect(rendered).to have_select(
        'paper[author_ids][]',
        selected: nil,
        options: authors.map(&:name)
      )
    end
  end

  context 'with existing paper' do
    let(:paper) { FactoryBot.create(:paper, authors: authors[0..2]) }

    it 'renders the edit paper form' do
      assert_select 'form[action=?][method=?]', paper_path(paper), 'post' do
        assert_select 'input[name=?]', 'paper[title]'
        assert_select 'input[name=?]', 'paper[venue]'
        assert_select 'input[name=?]', 'paper[year]'
        assert_select 'select[name=?]', 'paper[author_ids][]'
      end
    end

    it 'renders the paper attributes' do
      assert_select('input[value=?]', paper.title)
      assert_select('input[value=?]', paper.venue)
      assert_select('input[value=?]', paper.year.to_s)
    end

    it 'renders the select author field with the correct options' do
      expect(rendered).to have_select(
        'paper[author_ids][]',
        selected: authors[0..2].map(&:name),
        options: authors.map(&:name)
      )
    end
  end
end
