require 'date'
require 'bigdecimal'

DemoBestStock::Record = Struct.new(:Name, :Date, :Value) do
  def self.from_plain(hash)
    self.new(
      hash['Name'],
      Date.parse(hash['Date']),
      BigDecimal(hash['Value'])
    )
  end

  def to_plain
    { 'Name' => self.Name,
      'Date' => self.Date.strftime('%Y-%-m-%-d'),
      'Value' => self.Value.to_s('F') }
  end
end

class DemoBestStock::RecordByDate < DemoBestStock::Record
  include Comparable

  def <=>(other)
    self.Date <=> other.Date
  end
end
