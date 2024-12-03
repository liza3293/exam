class MyClass
  class << self
    def instance
      @instance ||= new
    end

    private :new
  end
end

obj1 = MyClass.instance
obj2 = MyClass.instance

puts obj1.equal?(obj2) # true
