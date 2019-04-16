require 'minitest/autorun'
require 'demo_best_stock'

class DemoBestStockRecordTest < Minitest::Test
  def test_from_to_plain
    record = DemoBestStock::Record.new(
      'c', Date.parse('2015-1-1'), BigDecimal('0.5')
    )
    plain = { 'Name' => 'c', 'Date' => '2015-1-1', 'Value' => '0.5' }
    from_plain = DemoBestStock::Record.from_plain(plain)
    assert_equal record, from_plain
    assert_equal plain, record.to_plain
  end
end

class DemoBestStockRecordByDateTest < Minitest::Test
  def test_by_date
    old_record = DemoBestStock::RecordByDate.new(
      'a', Date.parse('2015-1-1'), BigDecimal('0.5')
    )
    new_record = DemoBestStock::RecordByDate.new(
      'b', Date.parse('2015-1-2'), BigDecimal('0.5')
    )
    assert_operator old_record, :<, new_record
  end
end
