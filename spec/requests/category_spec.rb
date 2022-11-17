require 'rails_helper'

RSpec.describe Category, type: :request do
  describe 'GET /categories' do
    it 'should return http status 302' do
      get categories_path
      expect(response).to have_http_status(302)
    end

    it 'should redirect to login page' do
      get categories_path
      expect(response).to redirect_to(new_user_session_path)
    end
  end
end
