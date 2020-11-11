require 'rails_helper'

RSpec.describe 'Create author request', type: :request do
  let(:author) { FactoryBot.build :author }
  let(:params) do
    {
      first_name: author.first_name,
      last_name: author.last_name
    }
  end

  before { post authors_path, params: { author: params } }

  describe 'with valid params' do
    it 'redirects to the show page' do
      expect(response).to redirect_to :show
    end
  end

  describe 'with invalid params' do
    let(:params) { super().merge(first_name: '') }

    it 're-renders the new page' do
      expect(response).to render_template :new
    end
  end
end
