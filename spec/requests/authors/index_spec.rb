require 'rails_helper'

RSpec.describe 'Index author request', type: :request do
  let(:author) { FactoryBot.create :author }

  it 'renders the index page' do
    get authors_path
    expect(response).to be_successful
    expect(response).to render_template :index
  end
end
