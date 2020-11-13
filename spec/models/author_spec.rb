require 'rails_helper'

describe 'Author model', type: :model do
  let(:papers) { FactoryBot.create_list(:paper, 5) }
  let(:author_params) do
    {
      first_name: 'Alan',
      last_name: 'Turing',
      homepage: 'https://wikipedia.de/Alan_Turing',
      paper_ids: papers.map(&:id)
    }
  end
  let(:author) { Author.new author_params }

  describe 'with valid params' do
    it 'has all attributes defined' do
      expect(author.first_name).to eq('Alan')
      expect(author.last_name).to eq('Turing')
      expect(author.homepage).to eq('https://wikipedia.de/Alan_Turing')
      expect(author.papers).not_to be_empty
    end
  end

  describe 'with invalid params' do
    context 'without first_name' do
      let(:author_params) { super().merge(first_name: nil) }

      it 'is not valid' do
        expect(author).not_to be_valid
      end
    end

    context 'without last_name' do
      let(:author_params) { super().merge(last_name: nil) }

      it 'is not valid' do
        expect(author).not_to be_valid
      end
    end
  end

  context 'homepage method' do
    it 'returns true if the author has a website' do
      expect(author.homepage?).to be_truthy
    end

    it 'returns false if the author has no website' do
      author.homepage = nil
      expect(author.homepage?).to be_falsey
    end
  end

  context 'name method' do
    it 'returns the correct full name' do
      expect(author.name).to eq('Alan Turing')
    end
  end
end
