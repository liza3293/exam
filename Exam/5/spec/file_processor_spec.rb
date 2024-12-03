require 'rspec'
require_relative 'C:/Users/Home/RubymineProjects/Exam/5/FileProcessor.rb'

RSpec.describe FileProcessor do
  let(:test_file) { 'test_file.txt' }

  before do
    File.open(test_file, 'w') do |file|
      file.puts "рядок 1"
      file.puts "рядок 2"
      file.puts "рядок 1"
      file.puts "рядок 3"
      file.puts "рядок 2"
      file.puts "рядок 4"
    end
  end

  after do
    File.delete(test_file) if File.exist?(test_file)
  end

  describe '#unique_lines' do
    it 'повертає лише унікальні рядки у правильному порядку' do
      processor = FileProcessor.new(test_file)
      unique_lines = processor.unique_lines.to_a
      expect(unique_lines).to eq(["рядок 1", "рядок 2", "рядок 3", "рядок 4"])
    end

    it 'використовує lazy evaluation для обробки файлу' do
      processor = FileProcessor.new(test_file)
      expect(processor.unique_lines).to be_a(Enumerator::Lazy)
    end

    it 'коректно обробляє порожній файл' do
      File.write(test_file, "")
      processor = FileProcessor.new(test_file)
      unique_lines = processor.unique_lines.to_a
      expect(unique_lines).to eq([])
    end
  end
end
