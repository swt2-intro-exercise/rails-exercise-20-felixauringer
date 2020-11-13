require 'rails_helper'

RSpec.describe 'Index paper request', type: :request do
  let(:paper) { FactoryBot.create :paper }

  it 'renders the index page' do
    get papers_path
    expect(response).to be_successful
    expect(response).to render_template :index
  end
end
