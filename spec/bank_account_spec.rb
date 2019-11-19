require 'bank_account'

describe BankAccount do
  let(:transaction_mock) { double('Transaction') }
  let(:transaction) { double('Transaction') }
  let(:deposit1) { '1000.0' }
  let(:deposit2) { '2000.0' }
  let(:withdraw) { '500.0' }
  let(:balance1) { '0.0' }
  let(:balance2) { '1000.0' }
  let(:balance3) { '3000.0' }
  let(:new_balance1) { '1000.0' }
  let(:new_balance2) { '3000.0' }
  let(:new_balance3) { '2500.0' }
  let(:date1) { '10/01/2012' }
  let(:date2) { '13/01/2012' }
  let(:date3) { '14/01/2012' }
  let(:transaction1) { { date: date1, credit: deposit1, debit: '', balance: new_balance1 } }
  let(:transaction2) { { date: date2, credit: deposit2, debit: '', balance: new_balance2 } }
  let(:transaction3) { { date: date3, credit: '', debit: withdraw, balance: new_balance3 } }

  before do
    allow(transaction_mock).to receive(:new).with(deposit1, balance1).and_return(transaction)
    allow(transaction_mock).to receive(:new).with(deposit2, balance2).and_return(transaction)
    allow(transaction_mock).to receive(:new).with(withdraw, balance3).and_return(transaction)

    allow(transaction).to receive(:deposit).and_return(new_balance1)
    allow(transaction).to receive(:deposit).and_return(new_balance2)
    allow(transaction).to receive(:deposit).and_return(new_balance3)

    allow(transaction).to receive(:add_transaction).and_return(transaction1)
    allow(transaction).to receive(:add_transaction).and_return(transaction2)
    allow(transaction).to receive(:add_transaction).and_return(transaction3)

    allow(transaction).to receive(:deposit_value).and_return(deposit1)
    allow(transaction).to receive(:deposit_value).and_return(deposit2)
    allow(transaction).to receive(:withdraw_value).and_return(withdraw)
  end

  it 'has an initial balance of zero' do
    expect(subject.balance).to eq 0.0
  end

  it 'has an empty initial statement' do
    statement = "date || credit || debit || balance"
    expect(subject.print_statement).to eq(statement)
  end

  describe '#deposit' do

    it 'add a new transaction to the bank statement' do
      allow(subject).to receive(:date_now).and_return(date1)
      subject.deposit(1000.0)
      statement = "date || credit || debit || balance\n" +
                  date1 + " || " +
                  deposit1 + " ||  || " +
                  new_balance1
      expect(subject.print_statement).to eq(statement)
    end
  end

  describe '#withdraw' do
    it 'add a new transaction to the bank statement' do
      allow(subject).to receive(:date_now).and_return(date1)
      subject.deposit(1000.0)

      allow(subject).to receive(:date_now).and_return(date2)
      subject.deposit(2000.0)

      allow(subject).to receive(:date_now).and_return(date3)
      subject.withdraw(500.0)

      statement = "date || credit || debit || balance\n" +
                  date3 + " ||  || 500.0 || 2500.0\n" +
                  date2 + " || 2000.0 ||  || 3000.0\n" +
                  date1 + " || 1000.0 ||  || 1000.0"

      expect(subject.print_statement).to eq(statement)
    end

    it 'raise an error if the amount inserted is > than the balance' do
      expect { subject.withdraw(10) } .to raise_error 'No sufficient balance'
    end
  end

end
