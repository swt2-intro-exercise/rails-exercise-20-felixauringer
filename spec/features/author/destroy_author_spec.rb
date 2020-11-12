require 'rails_helper'

describe 'Destroy author page', type: :feature do
  before { FactoryBot.create :author }

  it 'removes the author from the database' do
    visit authors_path
    expect { click_link 'Delete' }.to change(Author, :count).from(1).to(0)
  end
end
