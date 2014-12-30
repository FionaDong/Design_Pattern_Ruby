require_relative 'bank_account'
require_relative 'bank_account_proxy'

account = BankAccount.new(30000)

proxy = BankAccountProxy.new("Bruce", account)

# proxy.balance
begin
  proxy.withdraw(800)
  puts "your account has #{proxy.balance} left."
rescue => e
  puts "Access checking failed."
end


begin
  proxy.deposit(3000)
  puts "your account has #{proxy.balance} left."
rescue => e
  puts "Access checking failed." if e.message.include?("Illegal access: ")
end
