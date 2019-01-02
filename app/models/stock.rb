class Stock < ApplicationRecord
  has_many  :user_stocks
  has_many  :users, through: :user_stocks

  def self.new_from_lookup(ticker)
    begin
      stock = StockQuote::Stock.quote(ticker)
      new(company: stock.company_name, ticker: stock.symbol, last_price: stock.latest_price)
    rescue Exception => e
      return nil
    end
  end

  def self.find_by_ticker(ticker)
    where(ticker: ticker).first
  end
end
