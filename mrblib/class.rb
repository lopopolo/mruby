class Module
  # 15.2.2.4.13
  def attr_reader(*names)
    names.each do |name|
      name = name.to_s
      raise(NameError, "#{name.inspect} is not allowed as an instance variable name") if name.include?('@') || name.include?('?')  || name.include?('$')
      
      name2 = ('@'+name).intern
      define_method(name){self.instance_variable_get(name2)}
    end
  end
  # 15.2.2.4.14
  def attr_writer(*names)
    names.each do |name|
      name = name.to_s
      raise(NameError, "#{name.inspect} is not allowed as an instance variable name") if name.include?('@') || name.include?('?')  || name.include?('$')
      
      name2 = ('@'+name).intern
      name = (name+"=").intern
      define_method(name){|v|self.instance_variable_set(name2,v)}
    end
  end
  # 15.2.2.4.12
  def attr_accessor(*names)
    attr_reader(*names)
    attr_writer(*names)
  end
  # 15.2.2.4.11
  def attr(name)
    attr_reader(name)
  end
end
