# puts File.dirname(__FILE__) + "*.rb"   

Dir[File.dirname(__FILE__) + "/*.rb"].each do |file|
  require file if File.basename(file) != __FILE__
end

manufacture_cake = ManufactureCake.new

puts manufacture_cake.total_number_basic_tasks