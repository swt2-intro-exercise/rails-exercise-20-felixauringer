require 'rails_helper'

RSpec.describe 'Show author request', type: :request do
  describe 'with valid id' do
    let(:author) { FactoryBot.create :author }

    it 'renders the show page' do
      get author_path(author.id)
      expect(response).to have_http_status :ok
      expect(response).to render_template :show
    end
  end

  describe 'with invalid id' do
    let(:invalid_author_id) { 42 }

    it 'renders the not found page' do
      expect { get author_path(invalid_author_id) }.to raise_error(ActionController::RoutingError)
    end
  end
end
