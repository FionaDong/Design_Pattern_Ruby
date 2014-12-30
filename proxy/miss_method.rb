require_relative 'bank_account'

class AccountMissMethod
  
  def initialize(real_account)
    @subject = real_account
  end

  def method_missing(name, *args)
    puts "Delegating #{name} message to subject."
    @subject.send(name, *args)
  end

end

bank_account = BankAccount.new(3000)
proxy = AccountMissMethod.new(bank_account)
proxy.deposit(300)
puts "balance for account is #{proxy.balance}."