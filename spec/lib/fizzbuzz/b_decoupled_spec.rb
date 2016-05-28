require 'spec_helper'

describe Fizzbuzz do
  describe '.decoupled' do
    let(:fb) { 'number' }   # this can be anything, we really don't care

    it 'outputs the Fizzbuzz numbers from 1 to 100' do
      (1..100).each do |n|
        expect(described_class).to receive(:fizzbuzz_number).with(n).ordered.and_return(fb)
      end
      expect { described_class.decoupled }.to output(100 * fb).to_stdout
    end
  end

  describe '.fizzbuzz_number' do
    context 'when given a multiple of 3' do
      context 'that is also a multiple of 5'
    end

    context 'when given a multiple of 5 (that is not also a multiple of 3)'

    context 'when given a number that is neither a multiple of 3 nor 5'

    # AAAAAND we can ALSO do this!
    context 'when given something that is not a number' do
      it 'freaks out' do
        expect do
          described_class.fizzbuzz_number 'one'
        end.to raise_error NoMethodError
      end
    end
  end
end
