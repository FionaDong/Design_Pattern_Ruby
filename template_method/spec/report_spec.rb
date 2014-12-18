require './spec_helper'

context 'Report' do
  describe 'in HTML' do
    it "generates report in html format." do
      html_report = HTMLReport.new
      html_report.output_report
    end
  end

  describe 'in Plain' do
    it "generate report in palin text." do
      plain_report = PlainReport.new
      plain_report.output_report
    end
  end
end