require_relative 'transaction'
require 'date'

class BankAccount

  attr_reader :balance

  def initialize(transaction = Transaction)
    @balance = 0.00
    @transactions = []
    @bank_statement = "date || credit || debit || balance"
    @transaction = transaction

  end

  def deposit(amount)
    transaction = @transaction.new(amount, @balance)
    @balance = transaction.deposit
    add_transaction(transaction)
  end

  def withdraw(amount)
    raise 'No sufficient balance' if amount > @balance

    transaction = @transaction.new(amount, @balance)
    @balance = transaction.withdraw
    add_transaction(transaction)
  end

  def print_statement
    @transactions.reverse_each do |transaction|
      @bank_statement += "\n" +
                        transaction[:date].to_s + " || " +
                        transaction[:credit].to_s + " || " +
                        transaction[:debit].to_s + " || " +
                        transaction[:balance].to_s
    end
    print @bank_statement
  end

  private

  def add_transaction(transaction)
    @transactions.push({ date: date_now, credit: transaction.deposit_value,
                        debit: transaction.withdraw_value, balance: @balance })
  end

  def date_now
    date = DateTime.now
    date.strftime("%d/%m/%Y")
  end

end
