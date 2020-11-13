require 'rails_helper'

RSpec.describe Paper, type: :model do
  let(:attributes) do
    {
      title: 'Test paper',
      venue: 'unknown venue',
      year: 1978
    }
  end
  let(:create_paper) { Paper.create attributes }

  context 'with valid attributes' do
    it 'can be created' do
      expect { create_paper }.to change(Paper, :count).by(1)
    end

    it 'has a list of papers' do
      create_paper
      expect(Paper.last.authors).to eq([])
    end
  end

  context 'without title' do
    let(:attributes) { super().merge(title: '') }

    it 'cannot be created' do
      expect { create_paper }.not_to change(Paper, :count)
    end
  end

  context 'without venue' do
    let(:attributes) { super().merge(venue: '') }

    it 'cannot be created' do
      expect { create_paper }.not_to change(Paper, :count)
    end
  end

  context 'without year' do
    let(:attributes) { super().merge(year: nil) }

    it 'cannot be created' do
      expect { create_paper }.not_to change(Paper, :count)
    end
  end

  context 'with non-integer year' do
    let(:attributes) { super().merge(year: []) }

    it 'cannot be created' do
      expect { create_paper }.not_to change(Paper, :count)
    end
  end
end
