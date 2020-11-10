require 'rails_helper'

describe 'Submitting the author form', type: :feature do
  let(:author_params) do
    {
      first_name: 'Alan',
      last_name: 'Turing',
      homepage: 'http://wikipedia.de/Alan_Turing'
    }
  end
  let(:author) { Author.new author_params }

  before do
    visit new_author_path
    fill_in('author[first_name]', with: author_params[:first_name])
    fill_in('author[last_name]', with: author_params[:last_name])
    fill_in('author[homepage]', with: author_params[:homepage])
  end

  it 'adds a new author to the database' do
    expect { click_button('Save Author') }.to change(Author.all, :count).from(0).to(1)
    expect(Author.first).to eq(author)
  end
end
