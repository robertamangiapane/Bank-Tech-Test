require 'bank_account'

describe BankAccount do
  it 'has an initial balance of zero' do
    expect(subject.balance).to eq 0
  end

  it 'has an empty initial statement' do
    statement = "date || credit || debit || balance"
    expect(subject.print_statement).to eq(statement)
  end

  describe '#deposit' do
    it 'add a new action to the bank statement' do
      date = '10/01/2012'
      allow(subject).to receive(:get_date).and_return(date)
      subject.deposit(1000.0)
      statement = "date || credit || debit || balance\n10/01/2012 || 1000.0 ||  || 1000.0"
      expect(subject.print_statement).to eq(statement)
    end
  end

  describe '#withdraw' do
    it 'add a new action to the bank statement' do
      date = '10/01/2012'
      allow(subject).to receive(:get_date).and_return(date)
      subject.deposit(1000.0)

      date1 = '13/01/2012'
      allow(subject).to receive(:get_date).and_return(date1)
      subject.deposit(2000.0)

      date2 = '14/01/2012'
      allow(subject).to receive(:get_date).and_return(date2)
      subject.withdraw(500.0)

      statement = "date || credit || debit || balance\n" + date + " || 1000.0 ||  || 1000.0\n" + date1 + " || 2000.0 ||  || 3000.0\n" + date2 + " ||  || 500.0 || 2500.0"
      expect(subject.print_statement).to eq(statement)
    end

    it 'raise an error if the amount inserted is > than the balance' do
      expect { subject.withdraw(10) } .to raise_error 'No sufficient balance'
    end
  end

end
