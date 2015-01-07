  # #singleton implementation
  # class SimpleLogger
    
  #   INFO = 1
  #   WARNING = 2
  #   ERROR = 3
    
  #   def initialize
  #     @log = File.open('log.txt', 'w')
  #     @level = WARNING
  #   end
  #   def error(msg)
  #     @log.puts(msg)
  #     @log.flush
  #   end
  #   def warning(msg)
  #     @log.puts(msg) if @level >= WARNING
  #     @log.flush
  #   end
  #   def info(msg)
  #     @log.puts(msg) if @level >= INFO
  #     @log.flush
  #   end

  #   @@instance = SimpleLogger.new

  #   def self.instance
  #     @@instance
  #   end

  #   private_class_method :new
  # end

#Ruby built-in module can come to help those heavy lifting, just include singleton.
#it helps to create class variable/initializing, make the class method private and creating class-level instance method.
require 'singleton'
class SimpleLogger
  include Singleton

  INFO = 1
  WARNING = 2
  ERROR = 3
  
  def initialize
    @log = File.open('log.txt', 'a')
    @level = WARNING
  end
  def error(msg)
    @log.puts(msg)
    @log.flush
  end
  def warning(msg)
    @log.puts(msg) if @level >= WARNING
    @log.flush
  end
  def info(msg)
    @log.puts(msg) if @level >= INFO
    @log.flush
  end

end

#class as singleton 
class ClassBasedLogger 
  
  ERROR = 1
  WARNING = 2
  INFO = 3

  @@log = File.open('log.txt', 'a') 
  @@level = WARNING

  def self.error(msg) 
    @@log.puts(msg) 
    @@log.flush
  end
  
  def self.warning(msg) 
    @@log.puts(msg) if @@level >= WARNING 
    @@log.flush
  end

  def self.info(msg)
    @@log.puts(msg) if @@level >= INFO 
    @@log.flush
  end

  def self.level=(new_level) 
    @@level = new_level
  end

  def self.level 
    @@level
  end
end

#module as singleton, module cannot be instantiate, the intent is a bit clearer from the code.
#Here is a bucket of methods meant to be called and not something you can instantiate.
module ModuleBasedLogger 
  
  ERROR = 1
  WARNING = 2
  INFO = 3

  @@log = File.open('log.txt', 'a') 
  @@level = WARNING

  def self.error(msg) 
    @@log.puts(msg) 
    @@log.flush
  end
  
  def self.warning(msg) 
    @@log.puts(msg) if @@level >= WARNING 
    @@log.flush
  end

  def self.info(msg)
    @@log.puts(msg) if @@level >= INFO 
    @@log.flush
  end

  def self.level=(new_level) 
    @@level = new_level
  end

  def self.level 
    @@level
  end
end

#below code ease the burden that singleton place on testing.
#you use SimpleLogger for functionality testing and SingletonLogger for production.
require 'singleton'
class SimpleLogger
    
  INFO = 1
  WARNING = 2
  ERROR = 3
  
  def initialize
    @log = File.open('log.txt', 'w')
    @level = WARNING
  end
  def error(msg)
    @log.puts(msg)
    @log.flush
  end
  def warning(msg)
    @log.puts(msg) if @level >= WARNING
    @log.flush
  end
  def info(msg)
    @log.puts(msg) if @level >= INFO
    @log.flush
  end

end

class SingletonLogger < SimpleLogger
  include Singleton
end