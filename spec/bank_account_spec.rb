require 'bank_account'

describe BankAccount do
  it 'has an initial balance of zero' do
    expect(subject.balance).to eq 0
  end

  it 'has an empty initial statement' do
    statement = "credit || debit || balance"
    expect(subject.print_statement).to eq(statement)
  end

  describe '#deposit' do
    it 'add a new action to the bank statement' do
      subject.deposit(10.0)
      statement = "credit || debit || balance\n10.0 ||  || 10.0"
      expect(subject.print_statement).to eq(statement)
    end
  end

  describe '#withdraw' do
    it 'add a new action to the bank statement' do
      subject.deposit(20.0)
      subject.withdraw(10.0)
      statement = "credit || debit || balance\n20.0 ||  || 20.0\n || 10.0 || 10.0"
      expect(subject.print_statement).to eq(statement)
    end

    it 'raise an error if the amount inserted is > than the balance' do
      expect { subject.withdraw(10) } .to raise_error 'No sufficient balance'
    end
  end

end
