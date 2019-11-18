class Bank_Account

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
    if amount > @balance
      raise "No sufficient balance"
    else
      @balance -= amount
    end
  end

end
