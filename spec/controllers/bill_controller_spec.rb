require 'rails_helper'

RSpec.describe BillController, type: :controller do

  describe 'GET #bill' do
    render_views

    let(:action) { get :show }

    it 'returns a 200 success' do
      action
      expect(response.status).to eql 200
    end

    context 'when there is no bill' do
      before { allow(Bill).to receive(:latest).and_return(nil) }

      it 'displays an error modal' do
        action
        expect(response.body).to include 'An error occurred whilst fetching your bill'
      end
    end
  end
end
