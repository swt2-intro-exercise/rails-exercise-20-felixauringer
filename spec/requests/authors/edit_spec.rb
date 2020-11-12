require 'rails_helper'

RSpec.describe 'Edit author request', type: :request do
  describe 'with valid id' do
    let(:author) { FactoryBot.create :author }

    it 'renders the edit author template' do
      get edit_author_path(author)
      expect(response).to have_http_status :ok
      expect(response).to render_template :edit
    end
  end

  describe 'with invalid id' do
    let(:invalid_author_id) { 42 }

    it 'renders the not found page' do
      expect { get edit_author_path(invalid_author_id) }.to raise_error(ActionController::RoutingError)
    end
  end
end
