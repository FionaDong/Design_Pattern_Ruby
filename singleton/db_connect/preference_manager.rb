require_relative 'db_connect_manager'

class PreferenceManager
  def initialize
    @reader = PreReader.new
    @writer = PreWriter.new
    @preferences = {:display_splash=>false, :background_color=>:blue}
  end

  def save_preference
    @writer.write(DatabaseConnectionManager.instance, @preferences)
  end

  def get_preference
    @preferences = @reader.reader(DatabaseConnectionManager.instance)
  end
end

class PreWriter
  def write(db_manager, preferences)
    db_manager.get_connection.write
  end

  def read(db_manager)
    db_manager.get_connection.read
  end
end