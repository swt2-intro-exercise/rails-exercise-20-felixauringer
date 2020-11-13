require 'rails_helper'

RSpec.describe 'home/index', type: :view do
  before { render }

  it "renders 'Paper Management System'" do
    expect(rendered).to have_text('Paper Management System')
  end

  it 'renders a link to the authors page' do
    expect(rendered).to have_link('Authors', href: authors_path)
  end

  it 'renders a link to the papers page' do
    expect(rendered).to have_link('Papers', href: papers_path)
  end
end
