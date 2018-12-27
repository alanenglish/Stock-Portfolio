class Stock < ApplicationRecord
  def self.new_from_lookup(ticker)
    begin
      stock = StockQuote::Stock.quote(ticker)
      new(company: stock.company_name, ticker: stock.symbol, last_price: stock.latest_price)
    rescue Exception => e
      return nil
    end
  end
end
