require 'rails_helper'
require 'support/form_helpers'

describe 'Submitting the edit paper form', type: :feature do
  let(:paper) { FactoryBot.create :paper }
  let(:updated_paper_params) do
    {
      title: 'Rspec in RoR',
      venue: 'New offer',
      year: 1092
    }
  end
  let(:updated_paper) { Paper.new updated_paper_params }

  before do
    visit edit_paper_path(paper)
    fill_in('paper[title]', with: updated_paper.title)
    fill_in('paper[venue]', with: updated_paper.venue)
    fill_in('paper[year]', with: updated_paper.year)
    submit_form
  end

  describe 'with valid attributes' do
    it 'changes the title' do
      expect { paper.reload }.to change(paper, :title).from(paper.title).to(updated_paper.title)
    end

    it 'changes the venue' do
      expect { paper.reload }.to change(paper, :venue).from(paper.venue).to(updated_paper.venue)
    end

    it 'changes the year' do
      expect { paper.reload }.to change(paper, :year).from(paper.year).to(updated_paper.year)
    end
  end

  describe 'without valid attributes' do
    let(:updated_paper) { Paper.new }

    it 'does not change the paper' do
      expect { paper.reload }.not_to change(paper, :hash)
    end

    it 'shows an error message' do
      expect(page).to have_text("Title can't be blank")
      expect(page).to have_text("Venue can't be blank")
      expect(page).to have_text("Year can't be blank")
      expect(page).to have_text('Year is not a number')
    end
  end
end
