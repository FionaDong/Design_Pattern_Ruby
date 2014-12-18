class HTMLReport

  def output_report(report)
    output_header(report)
    output_body(report)
    output_trailer
  end

  def output_header(context)
    puts "<html>"
    puts "<head>"
    puts "<title>#{context.title}</title>"
    puts "</head>"    
  end

  def output_body(context)
    puts "<body>" 
    context.text.each do |line|
      puts "<p>#{line}</p>"
    end
    puts "</body>"
  end

  def output_trailer
    puts "</html>"
  end  
end