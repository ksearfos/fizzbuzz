require 'spec_helper'

describe FizzBuzz do
  describe '.quick_and_dirty' do
    # this isn't particularly descriptive
    # what does that even mean,'fizzbuzz numbers'?
    it 'outputs the Fizzbuzz numbers from 1 to 100' do
      expect { FizzBuzz.quick_and_dirty }.to output("#{expected}\n").to_stdout
    end

    # THIS is annoying....
    # What happens if I change the requirements to be 1 to 10 million?
    # What happens if I change fizz/buzz to flip/blip?
    # What happens if I add the requirement that multiples of 2 are 'boom'?
    let(:expected) do <<OUT
1
2
Fizz
4
Buzz
Fizz
7
8
Fizz
Buzz
11
Fizz
13
14
FizzBuzz
16
17
Fizz
19
Buzz
Fizz
22
23
Fizz
Buzz
26
Fizz
28
29
FizzBuzz
31
32
Fizz
34
Buzz
Fizz
37
38
Fizz
Buzz
41
Fizz
43
44
FizzBuzz
46
47
Fizz
49
Buzz
Fizz
52
53
Fizz
Buzz
56
Fizz
58
59
FizzBuzz
61
62
Fizz
64
Buzz
Fizz
67
68
Fizz
Buzz
71
Fizz
73
74
FizzBuzz
76
77
Fizz
79
Buzz
Fizz
82
83
Fizz
Buzz
86
Fizz
88
89
FizzBuzz
91
92
Fizz
94
Buzz
Fizz
97
98
Fizz
Buzz
OUT
    end
  end
end
