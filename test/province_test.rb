gem 'minitest', '~> 5.4'
require 'minitest/autorun'
require 'minitest/pride'
require_relative '../lib/province'
require_relative '../lib/data'

class ProvinceTest < Minitest::Test

  def setup
     @asia = Province.new(sample_province_data)
     data = {
      name: "No proudcers",
      producers: [],
      demand: 30,
      price: 20
    };
    @no_producer_province = Province.new(data)
  end

  def test_province_shortfall
    assert_equal(5, @asia.shortfall)
  end
  
  def test_province_profit
    assert_equal(230, @asia.profit)
  end

  def test_no_producer_province_shortfall
    assert_equal(30, @no_producer_province.shortfall)
  end

  def test_no_producer_province_profit
    assert_equal(0, @no_producer_province.profit)
  end

  def test_zero_demand
    @asia.demand = 0;
    assert_equal(@asia.profit, 0)
    assert_equal(@asia.shortfall, -25)
  end

  def test_negative_demand
    @asia.demand = -1;
    assert_equal(@asia.profit, -10)
    assert_equal(@asia.shortfall, -26)
  end

  def test_null_demand
    @asia.demand = ''
    assert_equal(@asia.shortfall, -25)
    assert_equal(@asia.profit, 0)
  end

end