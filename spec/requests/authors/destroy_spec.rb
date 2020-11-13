require 'rails_helper'

RSpec.describe 'Destroy author request', type: :request do
  let(:author) { FactoryBot.create :author }

  describe 'with valid id' do
    it 'redirects to the index page' do
      delete author_path(author)
      expect(response).to redirect_to(action: :index)
    end
  end

  describe 'with invalid id' do
    let(:invalid_author_id) { 42 }

    it 'renders the not found page' do
      expect { delete author_path(invalid_author_id) }.to raise_error(ActionController::RoutingError)
    end
  end
end
