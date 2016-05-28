module FizzBuzz
  def self.quick_and_dirty
    (0..100).each do |number|
      output = ''
      output << 'Fizz' if number % 3
      output << 'Buzz' if number % 5

      puts output.empty? ? number : output
    end
  end
end
