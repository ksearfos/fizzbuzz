module FizzBuzz
  def self.decoupled
    (1..100).each do |number|
      puts fizzbuzz_number(number)
    end
  end

  def self.fizzbuzz_number number
    value = ''
    value << 'Fizz' if number % 3 == 0
    value << 'Buzz' if number % 5 == 0

    value.empty? ? number : value
  end
end
