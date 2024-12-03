thread = Thread.new do
  5.times do |i|
    puts "Потік працює: #{i}"
    sleep 1
  end
end

thread.join
puts "Головний потік завершено"
