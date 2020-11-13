require 'rails_helper'

describe 'Submitting the new paper form', type: :feature do
  let(:create_paper_action) { click_button('commit') }
  let!(:authors) { FactoryBot.create_list :author, 5 }

  before do
    visit new_paper_path
    fill_in('paper[title]', with: paper.title)
    fill_in('paper[venue]', with: paper.venue)
    fill_in('paper[year]', with: paper.year)
  end

  describe 'with valid attributes' do
    let(:paper) { FactoryBot.build :paper }

    it 'adds a new paper to the database' do
      expect { create_paper_action }.to change(Paper, :count).by(1)
      paper_db = Paper.last
      expect(paper_db.title).to eq(paper.title)
      expect(paper_db.venue).to eq(paper.venue)
      expect(paper_db.year).to eq(paper.year)
    end

    it 'saves the selected authors' do
      select authors[0].name, from: 'paper[author_ids][]'
      select authors[-1].name, from: 'paper[author_ids][]'
      create_paper_action
      expect(page).to have_text(authors[0].name)
      expect(page).to have_text(authors[-1].name)
    end
  end

  describe 'with invalid attributes' do
    let(:paper) { Paper.new }

    it 'does not add the paper to the database' do
      expect { create_paper_action }.not_to change(Paper, :count)
    end

    it 'shows an error message' do
      create_paper_action
      expect(page).to have_text("Title can't be blank")
      expect(page).to have_text("Venue can't be blank")
      expect(page).to have_text("Year can't be blank")
      expect(page).to have_text('Year is not a number')
    end
  end
end
