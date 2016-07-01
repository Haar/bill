require 'rails_helper'

describe Bill do
  describe '.latest' do
    context 'when able to pull the bill do' do
    end

    context 'when unable to pull the bill' do
      context 'when an exception is raised' do
        it 'returns nil' do
          expect(Net::HTTP).to receive(:get).and_raise(RuntimeError.new('Some exception'))
          expect(Bill.latest).to be_nil
        end
      end

      context 'when the end-point returns an empty object' do
        it 'returns nil' do
          expect(Net::HTTP).to receive(:get).and_return('{}')
          expect(Bill.latest).to be_nil
        end
      end
    end
  end
end
