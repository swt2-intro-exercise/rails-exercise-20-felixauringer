require 'rails_helper'

RSpec.describe 'Edit paper request', type: :request do
  describe 'with valid id' do
    let(:paper) { FactoryBot.create :paper }

    it 'renders the edit paper template' do
      get edit_paper_path(paper)
      expect(response).to be_successful
      expect(response).to render_template :edit
    end
  end

  describe 'with invalid id' do
    let(:invalid_paper_id) { 42 }

    it 'renders the not found page' do
      expect { get edit_paper_path(invalid_paper_id) }.to raise_error(ActionController::RoutingError)
    end
  end
end
