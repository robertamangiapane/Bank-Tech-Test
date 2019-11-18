require 'date'

class BankAccount

  attr_reader :balance

  def initialize
    @balance = 0.00
    @transactions = []
  end

  def deposit(amount)
    date = get_date
    @balance += amount
    add_transaction('credit', amount, date)
  end

  def withdraw(amount)
    raise 'No sufficient balance' if amount > @balance

    date = get_date
    @balance -= amount
    add_transaction('debit', amount, date)
  end

  def print_statement

    bank_statement = "date || credit || debit || balance"
    @transactions.each do |transaction|
      bank_statement += "\n" +
                        transaction[:date] + " || " +
                        transaction[:credit].to_s + " || " +
                        transaction[:debit].to_s + " || " +
                        transaction[:balance].to_s
    end

    bank_statement
  end

  private

  def add_transaction(transaction, amount, date)
    if transaction == 'credit'
      @transactions.push({ date: date, credit: amount, debit: "", balance: @balance })
    elsif transaction == 'debit'
      @transactions.push({ date: date, credit: "", debit: amount, balance: @balance })
    end
  end

  def get_date
    date = DateTime.now
    date.strftime("%d/%m/%Y")
  end

end
