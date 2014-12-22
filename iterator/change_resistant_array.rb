array = ['red','green','blue','purple']

array.each do |color|
  puts color
  array.delete(color) if color == 'green'
end

puts array.inspect

class Array
  def change_resistant_each
    @array = Array.new(self) #you have to new an array this way, coz pointer change is needed.
                            #@array = self cannot change pointer.
    i = 0
    while i < @array.length
      yield(@array[i])
      i += 1
    end
  end
  def to_s
    
  end
end


array = ['red','green','blue','purple']

array.change_resistant_each do |color|
  puts color
  array.delete(color) if color == 'green'
end

puts array.inspect