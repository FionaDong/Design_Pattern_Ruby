require_relative 'simple_writer'
require_relative 'writer_decorator'
require_relative 'module_decorator'

writer = CheckSummingWriter.new(TimeStampingWriter.new(NumberingWriter.new(SimpleWriter.new('final.txt'))))
writer.write_line('Hello out there.')

# #alias is applied to delegation(decorator pattern), this is a TimeStampingWriter.
# #which is limited, you cannot do alias twice to add line number, but for small-scale problems,
# #it would be great.
# w = SimpleWriter.new('final.txt')

# class << w
#   alias old_write_line write_line
#   def write_line(line)
#     old_write_line("#{Time.now}: #{line}")
#   end
#   # alias old_write_line write_line
#   # def write_line(line)
#   #   old_write_line("###: #{line}")
#   # end
#   def write_line(line)
#     super("#{Time.now}: #{line}")     
#   end 
# end

# w.write_line('Hello out there!')

# # add methods in module as eigen class method of w which is the instance method for SimpleWriter.
# w = SimpleWriter.new('final.txt')

# w.extend(NumberingWriterModule)
# w.extend(TimeStampingWriterModule)

# w.write_line('Hello from module.')




# #singleton method to be used to be applied to decorator pattern.
# w = SimpleWriter.new('final.txt')

# class << w
#   def write_line(line)
#     super("#{Time.now}: #{line}")     
#   end 
# end

# w.write_line('Hello out there!')