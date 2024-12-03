class MySingleton
  private_class_method :new

  def self.instance
    @instance ||= new
  end
end

obj1 = MySingleton.instance
obj2 = MySingleton.instance

puts obj1.equal?(obj2) # true
