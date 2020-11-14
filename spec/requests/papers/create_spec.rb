require 'rails_helper'

RSpec.describe 'Create paper request', type: :request do
  let(:paper) { FactoryBot.build :paper }
  let(:params) do
    {
      title: paper.title,
      venue: paper.venue,
      year: paper.year
    }
  end

  before { post papers_path, params: { paper: params } }

  describe 'with valid params' do
    it 'redirects to the show page' do
      expect(response).to redirect_to(paper_path(Paper.last))
    end
  end

  describe 'with invalid params' do
    let(:params) { super().merge(title: '') }

    it 're-renders the new page' do
      expect(response).to render_template :new
    end
  end
end
