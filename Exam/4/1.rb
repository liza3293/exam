require 'singleton'

class MySingleton
  include Singleton
end

obj1 = MySingleton.instance
obj2 = MySingleton.instance

puts obj1.equal?(obj2) # true, це той самий екземпляр
