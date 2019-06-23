require 'date'
require 'bigdecimal'

module DemoBestStock
  Record = Struct.new(:Name, :Date, :Value) do
    def self.from_plain(hash)
      new(
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

  class RecordByDate < DemoBestStock::Record
    include Comparable

    def <=>(other)
      self.Date <=> other.Date
    end
  end
end
