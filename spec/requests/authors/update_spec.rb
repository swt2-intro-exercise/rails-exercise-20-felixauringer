require 'rails_helper'

RSpec.describe 'Update author request', type: :request do
  let(:author) { FactoryBot.create :author }
  let(:updated_author) { FactoryBot.create(:author, :different) }
  let(:params) do
    {
      first_name: updated_author.first_name,
      last_name: updated_author.last_name
    }
  end

  before { patch author_path(author), params: { author: params } }

  describe 'with valid params' do
    it 'redirects to the show page' do
      expect(response).to redirect_to(author_path author)
    end
  end

  describe 'with invalid params' do
    let(:params) { super().merge(first_name: '') }

    it 're-renders the edit page' do
      expect(response).to render_template :edit
    end
  end
end
