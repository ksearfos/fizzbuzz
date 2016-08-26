require 'spec_helper'

describe FizzBuzz do
  # is there anything here that would not be "puts"-able?
  describe '.display' do
    it 'outputs the Fizzbuzz numbers from the given min to the given max' do
      expect(FizzBuzz).to receive(:cleaned_up).with(1, 1).and_return(['number'])
      expect { FizzBuzz.display(1, 1) }.to output("number\n").to_stdout
    end
  end

  # this method takes an optional start, an optional finish, that makes a range
  # then it iterates over the range!
  # defaults are 1, 100
  # what if they aren't numbers?
  # what if finish < start?
  # what if they are the same?
  # what if they are negatives?
  # what if they are decimals?
  # what if they are not numbers?
  # what if at least one is nil?
  # what if the range is really really big?
  describe '.cleaned_up' do
    it 'is a list of the Fizzbuzz numbers from min to max' do
      expect(FizzBuzz).to receive(:new_fizzbuzz_number).with(1).and_return('number')
      expect(FizzBuzz.cleaned_up(1, 1)).to eq %w(number)
    end
  end

  # this takes a number
  # what if it is not a number?
  # what if it is negative?
  # what if it is nil?
  # what if it is a decimal?
  # what if it is really really big?
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
          FizzBuzz.new_fizzbuzz_number 'one'
        end.to raise_error NoMethodError
      end
    end

    context 'when given nothing' do
      it 'freaks out' do
        expect do
          FizzBuzz.new_fizzbuzz_number nil
        end.to raise_error NoMethodError
      end
    end

    context 'when given a negative number' do
      context 'that is a multiple of 3 (only)' do
        it "is #{FizzBuzz::MOD_3}" do
          expect(FizzBuzz.new_fizzbuzz_number(-33)).to eq FizzBuzz::MOD_3
        end
      end

      context 'that is a multiple of 5  (only)' do
        it "is #{FizzBuzz::MOD_5}" do
          expect(FizzBuzz.new_fizzbuzz_number(-50)).to eq FizzBuzz::MOD_5
        end
      end

      context 'that is a multiple of 15' do
        it "is #{FizzBuzz::MOD_3}#{FizzBuzz::MOD_5}" do
          expect(FizzBuzz.new_fizzbuzz_number(-45)).to eq FizzBuzz::MOD_3 + FizzBuzz::MOD_5
        end
      end

      context 'that is neither a multiple of 3 nor 5' do
        it 'is the number' do
          expect(FizzBuzz.new_fizzbuzz_number(-49)).to eq -49
        end
      end
    end

    context 'when give a decmial' do
      let(:decimal) { 1.0 / 35 }

      it 'is the number' do
        expect(FizzBuzz.new_fizzbuzz_number(decimal)).to eq decimal
      end
    end

    context 'when given a really huge number' do
      let(:large_number) { 10^23 + 3 }  # neither a multiple of 3 nor 5

      it 'still works' do
        expect(FizzBuzz.new_fizzbuzz_number(large_number)).to eq large_number
      end
    end
  end
end
