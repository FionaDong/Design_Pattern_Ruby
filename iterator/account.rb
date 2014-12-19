class Account
  attr_accessor :balance, :name

  def initialize(name, balance)
    @name = name
    @balance = balance
  end
  def <=>(other)
    balance <=> other.balance 
  end
end