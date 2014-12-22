def subclass_of(superclass)
  subclasses = []
  ObjectSpace.each_object(Class) do |object|
    next if !object.ancestors.include?(superclass)||
              object == superclass||
              subclasses.include?(superclass.to_s)||
              object.to_s.include?('::')
    subclasses << object
  end
  subclasses
end


puts subclass_of(InstructionSeqence).inspect