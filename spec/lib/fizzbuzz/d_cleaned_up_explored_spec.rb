require 'rails_helper'

describe FizzBuzz do
  describe '.decoupled' do
    # this method takes an optional start, an optional finish
    # defaults are 1, 100
    # what if they aren't numbers?
    # what if finish is < start?
    # what if they are the same?
    # what if they are negatives?
    # what if they are DECIMALS?
    # sends it into fizzbuzznumber (tested below)
    # does something with OUTPUT of fizzbuzznumber -- how can that go wrong?
    # is there something that is not "puts"-able?
    it 'outputs the Fizzbuzz numbers from the given min to the given max' do
      expect(FizzBuzz).to receive(:new_fizzbuzz_number).with(1).and_return('number')
      expect { FizzBuzz.cleaned_up(1, 1) }.to output("number\n").to_stdout
    end
  end

  # this takes a number
  # what if it is not a number?
  # what if it is negative?
  # what if it is nil?
  # what if it is a decimal?
  # adds logic around the mod3/5 of the number
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
