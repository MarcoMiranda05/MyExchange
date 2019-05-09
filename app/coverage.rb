def all_countries
  puts Country.all.map {|country| country.name}.sort
  quit_or_menu

end

def all_currencies
  puts Currency.all.map { |currency|
    "#{currency.name} ==> #{currency.symbol}"
  }.sort
  quit_or_menu
end
