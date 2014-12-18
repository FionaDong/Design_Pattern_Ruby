require_relative 'report'

class PlainReport < Report
  def output_header
    puts "*********#{@title}*********"
  end

  def output_body
    @text.each do |line|
      puts line
    end
  end

  def output_trailer
  end
end