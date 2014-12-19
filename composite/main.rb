# puts File.dirname(__FILE__) + "*.rb"   
require 'pry'
Dir[File.dirname(__FILE__) + "/*.rb"].each do |file|
  require file if File.basename(file) != __FILE__
end

make_cake = MakeCake.new
make_cake.get_time_required