require 'etc'
require_relative 'bank_account'

class BankAccountProxy

  def initialize(owner_name, real_account)
    @owner_name = owner_name
    @real_account = real_account
  end

  def deposit(amount)
    check_access
    @real_account.deposit(amount)
  end

  def withdraw(amount)
    check_access
    @real_account.withdraw(amount)
  end

  def balance
    check_access
    @real_account.balance
  end

  def check_access
    raise "Illegal access: #{Etc.getlogin} cannot access this account!" if Etc.getlogin != @owner_name
  end
end


#method missing is applied to this function 
class BankAccountProxy

  def initialize(owner_name, real_account)
    @owner_name = owner_name
    @real_account = real_account
  end

  def method_missing(name, *args)
    check_access
    @real_account.send(name, *args)
  end
  
  def check_access
    raise "Illegal access: #{Etc.getlogin} cannot access this account!" if Etc.getlogin != @owner_name
  end
end
