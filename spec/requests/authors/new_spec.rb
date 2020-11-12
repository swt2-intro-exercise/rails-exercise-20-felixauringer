require 'rails_helper'

RSpec.describe 'New author request', type: :request do
  it 'renders the new author template' do
    get new_author_path
    expect(response).to have_http_status :ok
    expect(response).to render_template :new
  end
end
