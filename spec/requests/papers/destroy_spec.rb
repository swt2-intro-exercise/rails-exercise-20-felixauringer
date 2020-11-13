require 'rails_helper'

RSpec.describe 'Destroy paper request', type: :request do
  let(:paper) { FactoryBot.create :paper }

  describe 'with valid id' do
    it 'redirects to the index page' do
      delete paper_path(paper)
      expect(response).to redirect_to(action: :index)
    end
  end

  describe 'with invalid id' do
    let(:invalid_paper_id) { 42 }

    it 'renders the not found page' do
      expect { delete paper_path(invalid_paper_id) }.to raise_error(ActionController::RoutingError)
    end
  end
end
