class Stock < ApplicationRecord
  def self.new_from_lookup(ticker)
    stock = StockQuote::Stock.quote(ticker)
    new(company: stock.company_name, ticker: stock.symbol, last_price: stock.latest_price)
  end
end
