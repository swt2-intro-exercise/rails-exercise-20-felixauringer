require 'rails_helper'

RSpec.describe Paper, type: :model do
  let(:authors) { FactoryBot.create_list(:author, 3) }
  let(:paper_params) do
    {
      title: 'Test paper',
      venue: 'unknown venue',
      year: 1978,
      author_ids: authors.map(&:id)
    }
  end
  let(:paper) { Paper.new paper_params }

  describe 'with valid attributes' do
    it 'has all attributes defined' do
      expect(paper.title).to eq('Test paper')
      expect(paper.venue).to eq('unknown venue')
      expect(paper.year).to eq(1978)
      expect(paper.authors).not_to be_empty
    end
  end

  describe 'with invalid params' do
    context 'without title' do
      let(:paper_params) { super().merge(title: nil) }

      it 'is not valid' do
        expect(paper).not_to be_valid
      end
    end

    context 'without venue' do
      let(:paper_params) { super().merge(venue: nil) }

      it 'is not valid' do
        expect(paper).not_to be_valid
      end
    end

    context 'without year' do
      let(:paper_params) { super().merge(year: nil) }

      it 'is not valid' do
        expect(paper).not_to be_valid
      end
    end

    context 'with non-integer year' do
      let(:paper_params) { super().merge(year: []) }

      it 'is not valid' do
        expect(paper).not_to be_valid
      end
    end
  end

  context 'author_list method' do
    it 'shows the list of all associated authors separated by ,' do
      expect(paper.author_list).to eq("#{authors[0].name}, #{authors[1].name}, #{authors[2].name}")
    end
  end
end
