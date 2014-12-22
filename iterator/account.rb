class Account
  attr_reader :balance, :name

  def initialize(name, balance)
    @name = name
    @balance = balance
  end
  def <=>(other)
    @balance <=> other.balance 
    #reverse order
    # other.balance <=> @balance
  end

  def to_s
    "#{@name}'s balance is #{@balance}."
  end
end