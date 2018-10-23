class Stock < ApplicationRecord

  def self.new_form_lookup(ticker_symbol)

#begin .... rescue Exception => e : ratowanie przed errror

  begin
   looked_up_stock = StockQuote::Stock.quote(ticker_symbol)
   #price = looked_up_stock.latest_price
   #symbol = looked_up_stock.symbol
   #name = looked_up_stock.company_name
   new(name: looked_up_stock.company_name, ticker: looked_up_stock.symbol, last_price: looked_up_stock.latest_price )
 rescue Exception => e
  p e.inspect
  return nil


  end
end

end
