# this snippet of code use recursive algorithm to replace iterator or loop
#tokens1.each {|token| puts token}
#while tokens.pop {puts ***}
tokens1 = [1,2,3,4,5]

def expression tokens
  token = tokens.pop
  exit unless token
  puts token
  expression tokens
end

expression tokens1

