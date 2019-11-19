require 'transaction'

describe Transaction do

  describe '#deposit' do
    let(:subject) { described_class.new(1000.0, 0.0) }
    it 'add the amount of the transaction to the balance' do

      expect(subject.deposit).to eq 1000.0
    end
  end

  describe '#withdraw' do
    let(:subject) { described_class.new(500.0, 1000.0) }
    it 'subtract the amount of the transaction to the balance' do

      expect(subject.withdraw).to eq 500.0
    end
  end
end
