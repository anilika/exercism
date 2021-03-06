gem 'minitest', '>= 5.0.0'
require 'minitest/reporters'
require 'minitest/autorun'
require_relative 'perfect_numbers'

Minitest::Reporters.use!

class PerfectNumberTest < Minitest::Test
  def test_initialize_perfect_number
    assert_raises RuntimeError do
      PerfectNumber.classify(-1)
    end
  end

  def test_classify_deficient
    assert_equal 'deficient', PerfectNumber.classify(13)
  end

  def test_classify_perfect
    assert_equal 'perfect', PerfectNumber.classify(28)
  end

  def test_classify_abundant
    assert_equal 'abundant', PerfectNumber.classify(12)
  end

  def test_bookkeeping
    skip
    assert_equal 1, BookKeeping::VERSION
  end
end
