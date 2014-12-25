require 'pry'
class Decrypter
  def initialize(key)
    @key = key
  end

  def decrypt(reader, writer)
    key_index = 0
    while not reader.eof?
      clear_char = reader.getc
      encrypted_char = clear_char.ord ^ @key[key_index].ord
      writer.putc(encrypted_char)
      key_index = (key_index + 1) % @key.size
    end
  end  
end