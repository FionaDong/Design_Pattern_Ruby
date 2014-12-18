require_relative 'html'
require_relative 'plaintext'
require_relative 'report'

html_formatter = HTMLReport.new

plaintext_report = PlainTextReport.new

report = Report.new(html_formatter)
report.output_report

report = Report.new(plaintext_report)
report.output_report