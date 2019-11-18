class Bank_Account

  attr_reader :balance
  attr_writer :balance

  def initialize
    @balance = 0.00
  end

  def print_balance
    @balance
  end

end
