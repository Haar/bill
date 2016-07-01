require 'rails_helper'

RSpec.describe PagesController, type: :controller do

  describe 'GET #bill' do
    it 'returns a 200 success' do
      get :bill
      expect(response.status).to eql 200
    end
  end
end
