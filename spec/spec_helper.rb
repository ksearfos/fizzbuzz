require 'rspec'
require 'fizzbuzz'

RSpec.configure do |c|
	c.color = true

	# show the slowest tests
	c.profile_examples = true
end
