class BankAccount

  attr_reader :balance

  def initialize
    @balance = 0.00
  end

  def print_balance
    @balance
  end

  def deposit(amount)
    @balance += amount
  end

  def withdraw(amount)
    raise 'No sufficient balance' if amount > @balance

    @balance -= amount
  end

end
