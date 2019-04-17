require 'minitest/autorun'
require 'demo_best_stock'
require 'csv'

class DemoBestStockTest < Minitest::Test
  def test_best
    items = CSV.parse(<<~ROWS, headers: true)
      Name,Date,Value
      c,2015-1-1,0.5
      d,2015-1-10,7
      c,2015-1-5,10.5
      c,2015-1-2,5.5
      d,2015-1-12,37
      d,2015-1-22,2
      c,2015-1-1,0.5
    ROWS

    assert_equal(
      { 'Name' => 'c', 'Increment' => '10.0' },
      DemoBestStock.best(items)
    )
  end

  def test_best_bad_input
    items = CSV.parse(<<~ROWS, headers: true)
      Name,Date,Value
      c,2015-1-1,0.5
      c,2015-1-2,10.5
      c,2015-1-7,N/A
    ROWS

    assert_equal(
      { 'Name' => 'c', 'Increment' => '10.0' },
      DemoBestStock.best(items)
    )
  end
end
