require 'fileutils'

class Backup
  attr_accessor :interval, :data_sources, :backup_dir
  def initialize
    @data_sources = []
    @interval = 60
    @backup_dir = "#{File.dirname(__FILE__)}/backup"

  end

  def backup_files
    backup_new_folder = Time.new.ctime.tr(' :','_')
    backup_new_path = File.join(@backup_dir, backup_new_folder)
    @data_sources.each do |source|
      source.backup(backup_new_path)
    end
  end

  def run
    while true
      backup_files
      sleep @interval*60
    end
  end
end

class DataSource
  def initialize(source_path, expression)
    @expression = expression
    @source_path = source_path
  end
  
  def backup(to_dir)
    files = @expression.evaluate(source_path)
    files.each do |file|
      backup_file(to_dir, file)
    end  
  end

  def backup_file(to_dir, file)
    copy_path = File.dirname(File.join(to_dir, file))
    FileUtils.mkdir(copy_path)
    FileUtils.cp(file, copy_path)

  end
end