def create_a_user
  puts "Welcome to MyExchange!
  Let's setup your account!
  What is your full name?"

  name = gets.chomp

  puts "Nice to meet you, #{name}!
  Now define your username:"

  username = gets.chomp

  puts "Well done, #{name}! Now you're ready to plan and check your planned trips!"

  User.create(name: name, username: username)
end
