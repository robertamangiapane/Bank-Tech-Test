class BankAccount

  attr_reader :balance

  def initialize
    @balance = 0.00
    @transactions = []
  end

  def deposit(amount)
    @balance += amount
    add_transaction('credit', amount)
  end

  def withdraw(amount)
    raise 'No sufficient balance' if amount > @balance

    @balance -= amount
    add_transaction('debit', amount)
  end

  def print_statement
    bank_statement = "credit || debit || balance"
    @transactions.each do |transaction|
      bank_statement += "\n" +
                        transaction[:credit].to_s + " || " +
                        transaction[:debit].to_s + " || " +
                        transaction[:balance].to_s
    end

    bank_statement
  end

  private

  def add_transaction(transaction, amount)
    if transaction == 'credit'
      @transactions.push({ credit: amount, debit: "", balance: @balance })
    elsif transaction == 'debit'
      @transactions.push({ credit: "", debit: amount, balance: @balance })
    end
  end

end
