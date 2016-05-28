module FizzBuzz
  def self.decoupled
    (0..100).each do |number|
      puts fizzbuzz_number(number)
    end
  end

  def self.fizzbuzz_number number
    value = ''
    value << 'Fizz' if number % 3
    value << 'Buzz' if number % 5

    value.empty? ? number : value
  end
end
