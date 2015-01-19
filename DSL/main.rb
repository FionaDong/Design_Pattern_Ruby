require '../interpreter/terminal.rb'
require '../interpreter/nonterminal.rb'
# we can also use "load 'backup.pr'" to load file as Ruby program
# but eval and read would be clearer than load
# load 'backup.pr'
eval(File.read('backup.pr'))

backup '/home/russ/documents'
backup '/home/russ/music', file_name('*.mp3') & file_name('*.wav')
backup '/home/russ/images', except(file_name('*.tmp'))
to '/external_drive/backups'
interval 60