require_relative 'report'

class HTMLReport < Report
  def output_header
    puts "<html>"
    puts "<head>"
    puts "<title>#{@title}</title>"
    puts "</head>"    
  end

  def output_body
    puts "<body>" 
    @text.each do |line|
      puts "<p>#{line}</p>"
    end
    puts "</body>"
  end

  def output_trailer
    puts "</html>"
  end  
end