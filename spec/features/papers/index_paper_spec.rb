require 'rails_helper'

describe 'Paper index page', type: :feature do
  let!(:old_paper) { FactoryBot.create :paper, year: 1950 }
  let!(:new_paper) { FactoryBot.create :paper, year: 1968 }

  context 'without filter' do
    before { visit papers_path }

    it 'shows all papers' do
      expect(page).to have_text(old_paper.title)
      expect(page).to have_text(new_paper.title)
    end
  end

  context 'with filter for year=1950' do
    before { visit "#{papers_path}?year=1950" }

    it 'shows the old paper' do
      expect(page).to have_text(old_paper.title)
    end

    it 'does not show the new paper' do
      expect(page).not_to have_text(new_paper.title)
    end
  end
end
