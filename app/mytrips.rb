def create_a_trip

    puts "Insert you username:"
    #create user method
    username = gets.chomp
    user_name = User.all.find {|user| user.username == "#{username}"}.name
    user_id = User.all.find {|user| user.username == "#{username}"}.id
    puts "Welcome, #{user_name}!".colorize(:green)

    #assign country method
    prompt = TTY::Prompt.new
    countries = Country.all.map {|country| country.name}.sort
    home_country = prompt.select("Which is your home country?", countries, filter: true)
    home_country_id = Country.all.find {|country| country.name == "#{home_country}"}.id
      home_currency = find_currency_symbol_by_country("#{home_country}")
      base_currency = home_currency

    #assign target country method (recycle country selection)
    prompt = TTY::Prompt.new
    countries = Country.all.map {|country| country.name}.sort
    destination_country = prompt.select("You're traveling from #{home_country}. Where are you going to?", countries, filter: true)
    destination_country_id = Country.all.find {|country| country.name == "#{destination_country}"}.id

    #assign currency method
    destination_currency = find_currency_symbol_by_country("#{destination_country}")
    destination_currency_symbol = destination_currency
    base = RestClient.get("https://api.exchangeratesapi.io/latest?base=#{base_currency}")
    result = JSON.parse(base)
    convertion_rate = result["rates"]["#{destination_currency_symbol}"]

    #assign accomodation method
    prompt = TTY::Prompt.new
    accommodation = Accommodation.all.map {|accommodation| accommodation.name}
    accommodation_selection = prompt.select("Which kind of accommodation you're looking to stay?", accommodation, filter: true)
    accommodation_price = Accommodation.all.find {|accommodation| accommodation.name == "#{accommodation_selection}"}.price
    accommodation_id = Accommodation.all.find {|accommodation| accommodation.name == "#{accommodation_selection}"}.id


    puts "How many nights you are planning to stay?"
    amount_of_nights = gets.chomp

    puts "Considering meals and others expenses (like tickets, souvenirs, etc), how much extra money you would like to take for your trip?"
    extra_money = gets.chomp

    total_home_currency = extra_money.to_f + (accommodation_price * amount_of_nights.to_i)
    total_destination_currency = total_home_currency.to_f * convertion_rate.to_f

    puts "For you whole trip to #{destination_country} you will need #{base_currency}#{total_home_currency.round(2)}, which be equal to #{destination_currency_symbol}#{total_destination_currency.round(2)}".colorize(:green)

    Trip.create(user_id: user_id,
      home_country_id: home_country_id,
      destination_country_id: destination_country_id,
      accommodation_id: accommodation_id,
      amount_of_nights: amount_of_nights.to_i,
      total_destination_currency: total_destination_currency.to_f,
      total_home_currency: total_home_currency.to_f
      )

    quit_or_menu
end

def my_trips
  puts "Insert you username:"
  username = gets.chomp
  user_name = User.all.find {|user| user.username == "#{username}"}.name
  user_id = User.all.find {|user| user.username == "#{username}"}.id
  puts "Welcome, #{user_name}!".colorize(:green)

  all_my_trips = Trip.all.select {|trip| trip.user_id == user_id}

  table = TTY::Table.new ["Home", "Destination", "Accommodation", "Nights", "Foreign Currency", "Home Currency", "Rated When?"], []
  all_my_trips.select{|trip| trip.home_country && trip.destination_country && trip.accommodation }
    .each do |trip|
      table << [
        trip.home_country.name,
        trip.destination_country.name,
        trip.accommodation.name,
        trip.amount_of_nights,
        trip.total_destination_currency.round(2),
        trip.total_home_currency.round(2),
        trip.rated_when?.strftime("%b %d, %Y")
      ]
    end
  puts table.render(:unicode, width:150, resize:true)

  quit_or_menu
end

def top_destinations
  Trip.all.map {|trip| trip.destination_country
  }.group_by{|country| country.name}.map{|country, trips|[country, trips.count]
  }.sort_by{|country| country[1]}.reverse.map{|country| "#{country[1]} - #{country[0]}"
}.each{|string| puts string}

  quit_or_menu
end
