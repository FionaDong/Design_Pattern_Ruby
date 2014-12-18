#define an abstract class
class Report
  
  def initialize 
    @title = "Monthly Report"
    @text = ["things are going", "quite well"]
  end

  def output_report
    output_header
    output_body
    output_trailer
  end

  def output_header
    raise "Called abstract method: output_header."
  end

  def output_body
    raise "Called abstract method: output_body."
  end

  def output_trailer
    raise "Called abstract method: output_trailer."
  end

end