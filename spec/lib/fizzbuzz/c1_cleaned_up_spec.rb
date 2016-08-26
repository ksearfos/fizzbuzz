require 'spec_helper'

describe FizzBuzz do
  # this makes it easier if we decide to write to a file instead of STDOUT
  # also makes it easier to test really big ranges sent to cleaned_up
  describe '.display' do
    it 'outputs the Fizzbuzz numbers from the given min to the given max' do
      expect(FizzBuzz).to receive(:cleaned_up).with(1, 1).and_return(['number'])
      expect { FizzBuzz.display(1, 1) }.to output("number\n").to_stdout
    end
  end

  # oo! this is way better, only running once through the looping
  describe '.cleaned_up' do
    it 'outputs the Fizzbuzz numbers from the given min to the given max' do
      expect(FizzBuzz).to receive(:new_fizzbuzz_number).with(1).and_return('number')
      expect(FizzBuzz.cleaned_up(1, 1)).to eq %w(number)
    end
  end

  # now we don't need to change these tests if the customer wants flip/blib
  # and once again, adding a requirement that mod2 => boom is EASY
  describe '.new_fizzbuzz_number' do
    context 'when given a multiple of 3' do
      it "is #{FizzBuzz::MOD_3}" do
        expect(FizzBuzz.new_fizzbuzz_number(3)).to eq FizzBuzz::MOD_3
      end

      context 'that is also a multiple of 5' do
        it "is #{FizzBuzz::MOD_3}#{FizzBuzz::MOD_5}" do
          expect(FizzBuzz.new_fizzbuzz_number(15)).to eq FizzBuzz::MOD_3 + FizzBuzz::MOD_5
        end
      end
    end

    context 'when given a multiple of 5 (that is not also a multiple of 3)' do
      it "is #{FizzBuzz::MOD_5}" do
        expect(FizzBuzz.new_fizzbuzz_number(5)).to eq FizzBuzz::MOD_5
      end
    end

    context 'when given a number that is neither a multiple of 3 nor 5' do
      it 'is the number' do
        expect(FizzBuzz.new_fizzbuzz_number(1)).to eq 1
      end
    end

    context 'when given something that is not a number' do
      it 'freaks out' do
        expect do
          FizzBuzz.new_fizzbuzz_number nil
        end.to raise_error NoMethodError
      end
    end
  end
end
