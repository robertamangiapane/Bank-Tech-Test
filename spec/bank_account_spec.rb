require 'bank_account'

describe BankAccount do
  it 'has an initial balance of zero' do

    expect(subject.balance).to eq 0
  end

  describe '#print_balance' do
    it 'print the balance' do
      expect(subject.print_balance).to eq 0
    end
  end

  describe '#deposit' do
    it 'takes the money amount as argument and add them to the balance' do
      expect(subject.deposit(10)).to eq 10
    end
  end

  describe '#withdraw' do
    it 'takes the money amount as argument and subtract them to the balance' do
      subject.deposit(10)
      expect(subject.withdraw(10)).to eq 0
    end

    it 'raise an error if the amount inserted is > than the balance' do
      expect { subject.withdraw(10) } .to raise_error 'No sufficient balance'
    end
  end

end
