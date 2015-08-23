$LOAD_PATH.unshift File.expand_path('../../lib', __FILE__)
require 'tax_manipulator'

require 'minitest/autorun'
require 'minitest/reporters'

Minitest::Reporters.use! [Minitest::Reporters::SpecReporter.new(color: true)]
