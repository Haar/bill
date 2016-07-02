require 'rails_helper'

describe Bill do
  describe '.latest' do
    subject(:bill) { Bill.latest }

    context 'when able to pull the bill do' do
      before do
        allow(API).to receive(:get).and_return(
          YAML.load_file(Rails.root.join('spec/fixtures/success.yml'))
        )
      end

      it 'returns a Bill object' do
        expect(bill).to be_a Bill
      end

      it 'behaves as a hash' do
        expect(bill[:total]).to eql 100.63
        expect(bill[:call_charges][:total]).to eql 4.26
      end

      it 'underscores the keys from the JSON format' do
        expect(bill.keys).to include *[:sky_store, :call_charges]
        expect(bill[:sky_store].keys).to include :buy_and_keep
      end
    end

    context 'when unable to pull the bill' do
      context 'when an exception is raised' do
        it 'returns nil' do
          expect(Net::HTTP).to receive(:get).and_raise(RuntimeError.new('Some exception'))
          expect(bill).to be_nil
        end
      end

      context 'when the end-point returns an empty object' do
        it 'returns nil' do
          expect(Net::HTTP).to receive(:get).and_return('{}')
          expect(bill).to be_nil
        end
      end
    end
  end
end
