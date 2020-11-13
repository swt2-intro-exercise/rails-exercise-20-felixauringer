require 'rails_helper'

describe 'Submitting the new paper form', type: :feature do
  let(:create_paper) { click_button('commit') }
  let(:paper) { FactoryBot.create :paper }
  let!(:authors) { FactoryBot.create_list :author, 5 }

  before do
    visit new_paper_path
    fill_in('paper[title]', with: paper.title)
    fill_in('paper[venue]', with: paper.venue)
    fill_in('paper[year]', with: paper.year)
  end

  it 'selects the authors from the select field' do
    select authors[0].name, from: 'paper[author_ids][]'
    select authors[-1].name, from: 'paper[author_ids][]'
    create_paper
    expect(page).to have_text(authors[0].name)
    expect(page).to have_text(authors[-1].name)
  end
end
