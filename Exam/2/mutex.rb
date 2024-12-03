mutex = Mutex.new

counter = 0
threads = 10.times.map do
  Thread.new do
    mutex.synchronize do
      temp = counter
      sleep(0.1) # Імітація затримки
      counter = temp + 1
    end
  end
end
threads.each(&:join)
puts counter
