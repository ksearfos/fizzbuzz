require 'spec_helper'

describe FizzBuzz do
  describe '.decoupled' do
    let(:fb) { 'number' }   # this can be anything, we really don't care

    it 'outputs the Fizzbuzz numbers from 1 to 100' do
      (1..100).each do |n|
        expect(FizzBuzz).to receive(:fizzbuzz_number).with(n).ordered.and_return(fb)
      end
      expect { FizzBuzz.decoupled }.to output("#{fb}\n" * 100).to_stdout
    end
  end

  describe '.fizzbuzz_number' do
    context 'when given a multiple of 3' do
      it 'is Fizz' do
        expect(FizzBuzz.fizzbuzz_number(3)).to eq 'Fizz'
      end

      context 'that is also a multiple of 5' do
        it 'is FizzBuzz' do
          expect(FizzBuzz.fizzbuzz_number(15)).to eq 'FizzBuzz'
        end
      end
    end

    context 'when given a multiple of 5 (that is not also a multiple of 3)' do
      it 'is Buzz' do
        expect(FizzBuzz.fizzbuzz_number(5)).to eq 'Buzz'
      end
    end

    context 'when given a number that is neither a multiple of 3 nor 5' do
      it 'is the number' do
        expect(FizzBuzz.fizzbuzz_number(1)).to eq 1
      end
    end

    # AAAAAND we can ALSO do this!
    context 'when given something that is not a number' do
      it 'freaks out' do
        expect do
          FizzBuzz.fizzbuzz_number nil
        end.to raise_error NoMethodError
      end
    end
  end
end
