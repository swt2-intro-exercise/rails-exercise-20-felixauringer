require 'rails_helper'

RSpec.describe 'papers/index', type: :view do
  let(:papers) { FactoryBot.create_list(:paper, 5) }

  before do
    assign(:papers, papers)
    render
  end

  it 'renders a list of papers' do
    papers.each do |paper|
      assert_select 'tr>td', text: paper.title
      assert_select 'tr>td', text: paper.venue
      assert_select 'tr>td', text: paper.year.to_s
    end
  end

  it 'renders links for all papers' do
    papers.each do |paper|
      expect(rendered).to have_link('Show', href: paper_path(paper))
      expect(rendered).to have_link('Edit', href: edit_paper_path(paper))
      expect(rendered).to have_link('Delete', href: paper_path(paper))
    end
  end

  it 'renders a link to the new paper page' do
    expect(rendered).to have_link('New paper', href: new_paper_path)
  end

  it 'renders a link to the homepage' do
    expect(rendered).to have_link('Homepage', href: root_path)
  end
end
