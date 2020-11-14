require 'rails_helper'

RSpec.describe 'papers/new', type: :view do
  let(:paper) { FactoryBot.create :paper }
  let(:authors) { FactoryBot.create_list(:author, 5) }

  before do
    assign(:paper, paper)
    assign(:authors, authors)
    render
  end

  it 'has a link to the index page' do
    expect(rendered).to have_link('Back', href: papers_path)
  end
end
