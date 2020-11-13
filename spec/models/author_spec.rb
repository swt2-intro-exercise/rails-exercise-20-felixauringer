require 'rails_helper'

describe 'Author model', type: :model do
  let(:author_params) do
    {
      first_name: 'Alan',
      last_name: 'Turing',
      homepage: 'http://wikipedia.de/Alan_Turing'
    }
  end
  let(:author) { Author.new author_params }

  it 'has first_name, last_name and homepage' do
    expect(author.first_name).to eq(author_params[:first_name])
    expect(author.last_name).to eq(author_params[:last_name])
    expect(author.homepage).to eq(author_params[:homepage])
  end

  it 'has a list of papers' do
    expect(author.papers).to eq([])
  end

  it 'has a full name' do
    full_name = [author_params[:first_name], author_params[:last_name]].join(' ')
    expect(author.name).to eq(full_name)
  end
end
