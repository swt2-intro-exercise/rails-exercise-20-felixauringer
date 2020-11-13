require 'rails_helper'

describe 'Destroy author page', type: :feature do
  before do
    FactoryBot.create :author
    visit authors_path
  end

  it 'removes the author from the database' do
    expect { click_link 'Delete' }.to change(Author, :count).by(-1)
  end
end
