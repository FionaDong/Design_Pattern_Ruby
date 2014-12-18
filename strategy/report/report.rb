class Report
  attr_reader :title, :text
  
  def initialize(formatter)
    @title = "Monthly Report"
    @text = ["Things are going", "quite well"]
    @formatter = formatter
  end

  def output_report
    @formatter.output_report(self)
  end
end