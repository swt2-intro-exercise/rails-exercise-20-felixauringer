require 'rails_helper'

RSpec.describe 'Update paper request', type: :request do
  let(:paper) { FactoryBot.create :paper }
  let(:params) do
    {
      title: 'Another paper',
      venue: 'Another venue',
      year: 1789
    }
  end

  before { patch paper_path(paper), params: { paper: params } }

  describe 'with valid params' do
    it 'redirects to the show page' do
      expect(response).to redirect_to(paper_path(paper))
    end
  end

  describe 'with invalid params' do
    let(:params) { super().merge(title: '') }

    it 're-renders the edit page' do
      expect(response).to render_template :edit
    end
  end
end
