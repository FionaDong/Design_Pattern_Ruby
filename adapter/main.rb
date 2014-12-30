require_relative 'encrypt'
require_relative 'decrypt'
# require 'pry'
# get files
plaintext = File.open('./plaintext')
ciphertext = File.open('./ciphertext', 'w+')
plaintext_new = File.open('./plaintext_new','w')
#encrypt file
encrypter = Encrypter.new("secrect")
encrypter.encrypt(plaintext, ciphertext)
# original file closed
plaintext.close

ciphertext.reopen(File.open('./ciphertext', 'w+'))

decrypter = Decrypter.new("secrect")
decrypter.decrypt(ciphertext,plaintext_new)

ciphertext.close
plaintext_new.close