module FizzBuzz
  def self.quick_and_dirty
    (1..100).each do |number|
      output = ''
      output << 'Fizz' if number % 3 == 0
      output << 'Buzz' if number % 5 == 0

      puts output.empty? ? number : output
    end
  end
end
