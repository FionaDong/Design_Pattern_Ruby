hlass SlickButton
  def initailize(command)
    @command
  end

  def on_button_push
    @command.execute if @command
  end
end