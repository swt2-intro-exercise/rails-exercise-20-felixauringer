require 'rails_helper'

RSpec.describe 'papers/show', type: :view do
  let(:authors) { FactoryBot.create_list(:author, 5) }
  before(:each) do
    @paper = assign(:paper, Paper.create(
                              title: 'Title',
                              venue: 'Venue',
                              year: 2,
                              authors: authors
                            ))
  end

  it 'renders attributes in <p>' do
    render
    expect(rendered).to match(/Title/)
    expect(rendered).to match(/Venue/)
    expect(rendered).to match(/2/)
    expect(rendered).to have_text(authors[0].name)
    expect(rendered).to have_text(authors[-1].name)
  end
end
