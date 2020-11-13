require 'rails_helper'

describe 'Destroy author action', type: :feature do
  let(:author) { FactoryBot.create :author }

  before { visit author_path(author) }

  it 'removes the author from the database' do
    expect { click_link 'Delete author' }.to change(Author, :count).by(-1)
  end
end
