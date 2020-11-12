require 'rails_helper'

RSpec.describe 'Edit author request', type: :request do
  let(:author) { FactoryBot.create :author }

  it 'renders the edit author template' do
    get edit_author_path(author)
    expect(response).to have_http_status :ok
    expect(response).to render_template :edit
  end
end
