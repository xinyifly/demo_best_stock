require 'set'

module DemoBestStock
  def self.best(items)
    stocks = Hash.new { |hash, key| hash[key] = SortedSet.new([]) }
    items.each do |item|
      begin
        Float(item['Value'])
      rescue ArgumentError, TypeError
        next
      end

      stocks[item['Name']] << RecordByDate.from_plain(item)
    end

    best_stock = stocks.reduce(nil) do |stock, (key, set)|
      array = set.to_a
      increment = array.last.Value - array.first.Value

      if stock.nil? || increment > stock['Increment']
        { 'Name' => key, 'Increment' => increment }
      else
        stock
      end
    end
    best_stock['Increment'] = best_stock['Increment'].to_s('F')
    best_stock
  end
end

require 'demo_best_stock/record'
