def main_menu
  prompt = TTY::Prompt.new
  options = ["Conversion Calculator", "Plan a trip", "See countries and currencies covered", "Exit"]
  selection = prompt.select("
  Main Menu".colorize(:color => :green, :background => :black), options, cycle: true)

  case selection

  when options[0]
    conversion_menu
  when options[1]
    plan_trip_menu

  when options[2]
    check_coverage_menu

  when options[3]
    system "clear"
    pastel = Pastel.new
    puts pastel.black.bold("
  Thanks! See you next time.
    " )
    puts  "
  [̲̅$̲̅(̲̅ιο̲̅̅)̲̅$̲̅] [̲̅$̲̅(̲̅ιο̲̅̅)̲̅$̲̅] [̲̅$̲̅(̲̅ιο̲̅̅)̲̅$̲̅]
    ".colorize(:green)
    exit
  end
end

def plan_trip_menu
  prompt = TTY::Prompt.new
  options = ["Create a trip", "My Trips","Top destination",  "Top destination by country COMING SOON!", "Exit"]
  selection = prompt.select("
  What would you like to do?".colorize(:color => :green, :background => :black), options, cycle: true, filter: true)

  case selection

  when options[0]
    create_a_trip
  when options[1]
    my_trips
  when options[2]
    top_destinations
  when options[3]
    feature_coming_soon
  when options[4]
    system "clear"
    pastel = Pastel.new
    puts pastel.black.bold("
  Thanks! See you next time.
    " )
    puts  "
  [̲̅$̲̅(̲̅ιο̲̅̅)̲̅$̲̅] [̲̅$̲̅(̲̅ιο̲̅̅)̲̅$̲̅] [̲̅$̲̅(̲̅ιο̲̅̅)̲̅$̲̅]
    ".colorize(:green)
    exit
  end
end

def conversion_menu
  prompt = TTY::Prompt.new
  options =
    ["Convert your money",
    "Check your currency rate compared to a specific currency",
    "Check your currency rate compared all the others currencies",
    "Find the currency by country",
    "Find country by currency",
     "Exit"]

  selection = prompt.select("
  What would you like to do?".colorize(:color => :green, :background => :black), options, cycle: true)

    case selection

    when options[0]
      system "clear"
      convertor_app
    when options[1]
      system "clear"
      checking_specific_currency
    when options[2]
      system "clear"
      checking_all_currencies
    when options[3]
      system "clear"
      find_by_country
    when options[4]
      system "clear"
      find_by_currency

    when options[5]
      pastel = Pastel.new
      puts pastel.black.bold("
    Thanks! See you next time.
      " )
      puts  "
    [̲̅$̲̅(̲̅ιο̲̅̅)̲̅$̲̅] [̲̅$̲̅(̲̅ιο̲̅̅)̲̅$̲̅] [̲̅$̲̅(̲̅ιο̲̅̅)̲̅$̲̅]
      ".colorize(:green)
      exit
    end
end

def check_coverage_menu

  prompt = TTY::Prompt.new
  options =
    ["Check all the countries covered by us",
      "Check all the currencies covered by us",
     "Exit"]

  selection = prompt.select("
  What would you like to do?".colorize(:color => :green, :background => :black), options, cycle: true)


  case selection
  when options[0]
    system "clear"
    all_countries
  when options[1]
    system "clear"
    all_currencies
  when options[2]
    pastel = Pastel.new
    puts pastel.black.bold("
  Thanks! See you next time.
    " )
    puts  "
  [̲̅$̲̅(̲̅ιο̲̅̅)̲̅$̲̅] [̲̅$̲̅(̲̅ιο̲̅̅)̲̅$̲̅] [̲̅$̲̅(̲̅ιο̲̅̅)̲̅$̲̅]
    ".colorize(:green)
    exit

  end
end

def quit_or_menu
  prompt = TTY::Prompt.new
  options = ["Convert money", "Plan a trip", "Check Coverage", "Exit"]
  answer = prompt.select( "
  Would you like to go back to the main menu or exit?".colorize(:color => :green, :background => :black),
    options)
  case answer

  when options[0]
    system "clear"
    conversion_menu
  when options[1]
    system "clear"
    plan_trip_menu
  when options[2]
    system "clear"
    check_coverage_menu
  when options[3]
    system "clear"
    pastel = Pastel.new
    puts pastel.black.bold("
    Thanks! See you next time.
    " )
    puts  "
    [̲̅$̲̅(̲̅ιο̲̅̅)̲̅$̲̅] [̲̅$̲̅(̲̅ιο̲̅̅)̲̅$̲̅] [̲̅$̲̅(̲̅ιο̲̅̅)̲̅$̲̅]
    ".colorize(:green)
    exit
  end
end

def feature_coming_soon
  puts  "Hold on! Soon you'll be able to checkout the top vacation spots for people from your country"

  quit_or_menu
end
