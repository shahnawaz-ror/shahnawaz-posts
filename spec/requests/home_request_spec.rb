require 'rails_helper'

# include Devise::Test::ControllerHelpers
RSpec.describe 'Homes', type: :request do
  describe 'GET /index' do
    it 'returns http authentication required' do
      get '/home/index'
      expect(response).to have_http_status(302)
    end
  end
end
