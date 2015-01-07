require_relative 'log_singleton'
require 'pry'

logger = SimpleLogger.instance
# binding.pry
logger.error("this is a line of error.")

#class as singleton
ClassBasedLogger.error("this is a class based logger error.")

#module as singleton
ModuleBasedLogger.error("this is a module based logger error.")