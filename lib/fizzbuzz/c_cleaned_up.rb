module FizzBuzz
  MOD_3 = 'Fizz'.freeze
  MOD_5 = 'Buzz'.freeze

  def self.display min = 1, max = 100
    puts cleaned_up(min, max).join("\n")
  end

  def self.cleaned_up min, max
    (min..max).to_a.map do |number|
      new_fizzbuzz_number(number)
    end
  end

  def self.new_fizzbuzz_number number
    value = ''
    value << MOD_3 if number % 3 == 0
    value << MOD_5 if number % 5 == 0

    value.empty? ? number : value
  end
end
