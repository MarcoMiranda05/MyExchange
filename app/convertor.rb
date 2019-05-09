def find_by_country
  prompt = TTY::Prompt.new
  countries = Country.all.map {|country| country.name}.sort
  user_selection = prompt.select("
  Which country are you looking for?".colorize(:color => :green, :background => :black), countries, filter: true)

  puts Currencyusage.all.find{|currencyusage| currencyusage.country.name == "#{user_selection}"}.currency.name
  quit_or_menu
end

def find_currency_symbol_by_country(country)
  Currencyusage.all.find{|currencyusage| currencyusage.country.name == country}.currency.symbol
end

def find_by_currency
  prompt = TTY::Prompt.new
  currencies = Currency.all.map {|currency| currency.name}.sort
  user_selection = prompt.select("
  Which currency are you looking for?".colorize(:color => :green, :background => :black), currencies, filter: true)

  puts Currencyusage.all.select{ |currencyusage| currencyusage.currency.name == "#{user_selection}"}.map {|currencyusage| currencyusage.country.name}
  quit_or_menu
end

def checking_all_currencies
  prompt = TTY::Prompt.new
  countries = Country.all.map {|country| country.name}.sort
  user_selection = prompt.select("
  Which country currency do you want to check?".colorize(:color => :green, :background => :black), countries, filter: true)

  country_name = find_currency_symbol_by_country("#{user_selection}")
  your_currency = country_name
  base = RestClient.get("https://api.exchangeratesapi.io/latest?base=#{your_currency}")
  result = JSON.parse(base)

   rates_only = result["rates"]
   table_rows = []
   rates_only.each do |symbol, rate|
     table_rows << [symbol, rate.round(2)]
   end
   table = TTY::Table.new ["Currency", "Rate"], table_rows
   renderer = TTY::Table::Renderer::ASCII.new(table)
   puts renderer.render
   quit_or_menu
end

def checking_specific_currency
  prompt = TTY::Prompt.new
  countries = Country.all.map {|country| country.name}.sort
  user_selection = prompt.select("
  Which is your home country?".colorize(:color => :green, :background => :black), countries, filter: true)
    country_name = find_currency_symbol_by_country("#{user_selection}")
    your_currency = country_name

  prompt = TTY::Prompt.new
  countries = Country.all.map {|country| country.name}.sort
  user_selection = prompt.select("
  Your currency is #{your_currency}. Which currency do you want to compare with?".colorize(:color => :green, :background => :black), countries, filter: true)

    target_country_name = find_currency_symbol_by_country("#{user_selection}")
    target_currency = target_country_name
    base = RestClient.get("https://api.exchangeratesapi.io/latest?base=#{your_currency}")
    result = JSON.parse(base)
    final_result = result["rates"]["#{target_currency}"]
  puts "
  Every" + " #{your_currency}".colorize(:green) + " is equal to" + " #{final_result.round(2)} #{target_currency}".colorize(:green)
  quit_or_menu
end

def convertor_app
  prompt = TTY::Prompt.new
  countries = Country.all.map {|country| country.name}.sort
  user_selection = prompt.select("
  Which is your home country?".colorize(:color => :green, :background => :black), countries, filter: true)

  country_name = find_currency_symbol_by_country("#{user_selection}")
  your_currency = country_name

  prompt = TTY::Prompt.new
  countries = Country.all.map {|country| country.name}.sort
  user_selection = prompt.select("
  Your currency is #{your_currency}. Which currency do you want to convert to?".colorize(:color => :green, :background => :black), countries, filter: true)

  target_country_name = find_currency_symbol_by_country("#{user_selection}")
  target_currency = target_country_name
  base = RestClient.get("https://api.exchangeratesapi.io/latest?base=#{your_currency}")
  result = JSON.parse(base)
  final_result = result["rates"]["#{target_currency}"]
  puts "
  How much do you want to convert?".colorize(:color => :green, :background => :black)
  value = gets.chomp
  total = final_result.to_f * value.to_f
  puts "
  Great!" + "
  #{value} #{your_currency}".colorize(:green) + " is equal to" + " #{total.round(2)} #{target_currency}".colorize(:green)

  quit_or_menu
end
