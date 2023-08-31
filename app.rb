require_relative 'class/book'
require_relative 'class/person'
require_relative 'class/teacher'
require_relative 'class/student'
require_relative 'class/rental'

class App
  def initialize
    @persons = []
    @books = []
    @rentals = []
  end

  # create person
  def create_person
    print 'Do you want to create a student (1) or a teacher(2)? [Input the number]:'
    input_result = gets.chomp

    print 'Age:'
    age = gets.chomp.to_i
    print 'Name:'
    name = gets.chomp

    case input_result
    when '1'
      print 'Has parent permission? [Y/N]: '
      permission = gets.chomp
      permission = true if %w[Y y].include?(permission)
      permission = false if %w[N n].include?(permission)

      @persons << Student.new(age, name, parent_permission: permission)
    when '2'
      print 'Specialization: '
      specialization = gets.chomp

      @persons << Teacher.new(specialization, age, name)

    end

    puts 'Person created succesfully'
  end

  # list all person
  def list_persons
    @persons.each do |p|
      print_person(p)
    end
  end

  # create book
  def create_book
    print 'Title: '
    title = gets.chomp
    print 'Author: '
    author = gets.chomp

    @books << Book.new(title, author)
    puts 'Book created succesfully'
  end

  # list all book
  def list_books
    @books.each do |b|
      print_book(b)
    end
  end

  # create a rental
  def create_rental
    puts 'Select a book from the following list by number'
    @books.each_with_index do |b, i|
      print "#{i}) "
      print_book(b)
    end

    book_index = gets.chomp.to_i

    puts 'Select a person from the following list by number (not id)'
    @persons.each_with_index do |p, i|
      print "#{i}) "
      print_person(p)
    end

    person_index = gets.chomp.to_i

    date = Date.today
    @rentals << Rental.new(date, @books[book_index], @persons[person_index])
    puts date
    puts 'Rental created successfully'
  end

  def list_rentals_by_person_id
    print 'Enter a person ID:'
    person_id = gets.chomp.to_i

    person = @persons.find { |p| p.id == person_id }
    rentals = @rentals.select { |r| r.person == person }
    puts 'Rentals'
    rentals.each do |r|
      puts "Date: #{r.date}, Book: #{r.book.title} by #{r.book.author}"
    end
  end

  # print person
  def print_person(person)
    puts "[#{person.class.name}] Name: #{person.name}, ID: #{person.id}, Age: #{person.age}"
  end

  # print book
  def print_book(book)
    puts "Title: \"#{book.title}\", Author: #{book.author}"
  end
end
