require 'rails_helper'

RSpec.describe 'New paper request', type: :request do
  it 'renders the new paper template' do
    get new_paper_path
    expect(response).to be_successful
    expect(response).to render_template :new
  end
end
