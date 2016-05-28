require 'spec_helper'

describe FizzBuzz do
  describe '.decoupled' do
    let(:fb) { 'number' }   # this can be anything, we really don't care

    # oo! this is way better, only running once through the looping
    # also easier if we decide to write to a file instead of STDOUT
    it 'outputs the Fizzbuzz numbers from the given min to the given max' do
      expect(FizzBuzz).to receive(:new_fizzbuzz_number).with(1).and_return(fb)
      expect { FizzBuzz.cleaned_up(min = 1, max = 1) }.to output("#{fb}\n").to_stdout
    end
  end

  # now we don't need to change these tests if the customer wants flip/blib
  # and once again, adding a requirement that mod2 => boom is EASY
  describe '.new_fizzbuzz_number' do
    context 'when given a multiple of 3' do
      it 'is Fizz' do
        expect(FizzBuzz.new_fizzbuzz_number(3)).to eq FizzBuzz::MOD_3
      end

      context 'that is also a multiple of 5' do
        it 'is FizzBuzz' do
          expect(FizzBuzz.new_fizzbuzz_number(15)).to eq FizzBuzz::MOD_3 + FizzBuzz::MOD_5
        end
      end
    end

    context 'when given a multiple of 5 (that is not also a multiple of 3)' do
      it 'is Buzz' do
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
