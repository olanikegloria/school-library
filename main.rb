require_relative 'app'

app = App.new

puts "Welcome to School Library App! \n\n"

loop do
  puts 'Choose an option:'
  puts '1. List all books'
  puts '2. List all people'
  puts '3. Create a person'
  puts '4. Create a book'
  puts '5. Create a rental'
  puts '6. List all rentals for a given person ID'
  puts '7. Quit'
  option = gets.chomp

  case option
  when '1'
    app.list_books
  when '2'
    app.list_persons
  when '3'
    app.create_person
  when '4'
    app.create_book
  when '5'
    app.create_rental
  when '6'
    app.list_rentals_by_person_id
  when '7'
    print 'Thank you for using this app!'
    break
  end

  puts "\n"
end
