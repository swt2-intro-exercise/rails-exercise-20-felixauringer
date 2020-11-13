require 'rails_helper'

describe 'Destroy paper action', type: :feature do
  let(:paper) { FactoryBot.create :paper }

  before { visit paper_path(paper) }

  it 'removes the paper from the database' do
    expect { click_link 'Delete paper' }.to change(Paper, :count).by(-1)
  end
end
