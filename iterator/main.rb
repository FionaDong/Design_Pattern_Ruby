require_relative 'portfolio'
require_relative 'account'

sgp_account = Account.new 'sgp', 5000
china_account = Account.new 'china', 10000
japan_account = Account.new 'japan', 10


portfolio = Portfolio.new

portfolio.add_account sgp_account
portfolio.add_account china_account
portfolio.add_account japan_account
# is_it = portfolio.all? do |account|
#   account.balance > 100
# end

# is_it = portfolio.any? {|account| account.balance > 10000}

# puts is_it
portfolio.accounts.sort!

puts portfolio.accounts[0].name