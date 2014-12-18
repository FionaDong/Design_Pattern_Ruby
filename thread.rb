# require 'pry'
# thread1 = Thread.new do
#   puts "thread 1 starts."
#   Thread.stop
#   puts "thread 1 ends."
# end

# sleep 0.1 while thread1.status != 'sleep'

# puts "Got here."

# thread1.run

# thread1.join

thread1 = Thread.new do
  sum=0
  1.upto(10) {|x| sum = sum + x}
  puts("The sum of the first 10 integers is #{sum}.\n")
end

thread2 = Thread.new do
  product=1
  1.upto(20) {|x| product = product * x}
  puts("The product of the first 20 integers is #{product}.\n")
end


thread1.join
thread2.join