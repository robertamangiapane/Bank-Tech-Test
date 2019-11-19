class Transaction
  attr_reader :deposit_value, :withdraw_value, :new_balance

  def initialize(amount, balance)
    @amount = amount
    @deposit_value = ''
    @withdraw_value = ''
    @balance = balance
    @new_balance = nil
  end

  def deposit
    @deposit_value = @amount
    @new_balance = @balance + @amount
  end

  def withdraw
    @withdraw_value = @amount
    @new_balance = @balance - @amount
  end
end
