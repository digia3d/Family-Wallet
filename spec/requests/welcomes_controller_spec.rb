require 'rails_helper'

RSpec.describe 'Welcomes', type: :request do
  before(:each) { get root_path }
  describe 'testing index for welcomes controller' do
    it 'should have http status ok' do
      expect(response).to have_http_status(:ok)
    end

    it 'should render index template' do
      expect(response).to render_template(:index)
    end

    it 'should have a title' do
      expect(response.body).to include('Family Wallet')
    end

    it 'should have a link to sign up' do
      expect(response.body).to include('Sign Up')
    end

    it 'should have a link to log in' do
      expect(response.body).to include('Log In')
    end
  end
end
