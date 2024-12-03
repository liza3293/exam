class FileProcessor
  include Enumerable

  def initialize(file_path)
    @file_path = file_path
  end

  def unique_lines
    Enumerator.new do |yielder|
      seen = Set.new
      File.foreach(@file_path) do |line|
        cleaned_line = line.strip
        unless seen.include?(cleaned_line)
          yielder << cleaned_line
          seen.add(cleaned_line)
        end
      end
    end.lazy
  end
end

if __FILE__ == $0

  file_processor = FileProcessor.new("C:/Users/Home/Desktop/test.txt")

  file_processor.unique_lines.each do |line|
    puts line
  end
end
