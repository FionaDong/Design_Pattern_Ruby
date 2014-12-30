require_relative 'bank_account'
# the virtual proxy involved in creating bank account object which is quite coupled. 
class VirtualProxy
  def initialize(start_balance = 0)
    @start_balance = start_balance
  end

  def deposit(amount)
    s = subject
    s.deposit(amount)
  end

  def withdraw(amount)
    s = subject
    s.withdraw(amount)
  end
  def balance
    s = subject
    s.balance
  end

  def subject
    @subject || (@subject = BankAccount.new(@start_balance))
  end
end

#block comes to help, it depends on which block passed in new method.
class VirtualProxy
  def initialize(&creation_block)
    @creation_block = creation_block
  end

  def deposit(amount)
    s = subject
    s.deposit(amount)
  end

  def withdraw(amount)
    s = subject
    s.withdraw(amount)
  end
  def balance
    s = subject
    s.balance
  end

  def subject
    @subject || (@subject = @creation_block.call)
  end
end

v_proxy = VirtualProxy.new { BankAccount.new(30000)}
puts v_proxy.balance
