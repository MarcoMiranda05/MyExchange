class Country < ActiveRecord::Base

  has_many :currencyusages
  has_many :trips

  def currency
    self.currencyusages[0].currency
  end

end
