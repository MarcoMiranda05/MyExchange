def money_art
puts "
  "
puts "
────────────────────────────────████████─█────────────────────────────
────────────────────────────██████████████────────────────────────────
────────────────────────────█████████████─────────────────────────────
─────────────────────────────███████████──────────────────────────────
──────────────────────────────██████████──────────────────────────────
───────────────────────────────████████───────────────────────────────
───────────────────────────────▐██████────────────────────────────────
───────────────────────────────▐██████────────────────────────────────
─────────────────────────────── ▌─────▌───────────────────────────────
───────────────────────────────███─█████──────────────────────────────
───────────────────────────████████████████───────────────────────────
─────────────────────────████████████████████─────────────────────────
───────────────────────████████████─────███████───────────────────────
─────────────────────███████████─────────███████──────────────────────
────────────────────████████████───██─███████████─────────────────────
───────────────────██████████████──────────████████───────────────────
──────────────────████████████████─────█───█████████──────────────────
─────────────────█████████████████████─██───█████████─────────────────
────────────────█████████████████████──██──██████████────────────────
───────────────███████████████████████─██───██████████───────────────
───────────────████████████████████████──────██████████───────────────
───────────────███████████████████──────────███████████───────────────
────────────────██████████████████───────██████████████───────────────
────────────────███████████████████████──█████████████────────────────
─────────────────█████████████████████████████████████────────────────
──────────────────██████████████████████████████████──────────────────
──────────────────────██████████████████████████──────────────────────
────────────────────────────███████████████───────────────────────────
".colorize(:green)
end

def greeting
  font = TTY::Font.new(:doom)
  pastel = Pastel.new
  puts pastel.black.bold(font.write("MyExchange"))
  puts "

  
  "
end