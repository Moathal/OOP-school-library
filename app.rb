require './book'
require './rental'
require './student'
require './teacher'
require './person'
require './methods'

class App
  @books = {}
  @people = {}
  @rentals = {}

  puts "Welcome to school library App!\n \n"

  loop do
    puts 'Please choose an option by entering a number:'
    puts '1. List all books'
    puts '2. List all people'
    puts '3. Create a person'
    puts '4. Create a book'
    puts '5. Create a rental'
    puts '6. List all rentals of a given person id'
    puts '7. Exit'

    choice = gets.chomp.to_i

    case choice
    when 1
      list_books
    when 2
      list_people
    when 3
      create_person
    when 4
      create_book
    when 5
      create_rental
    when 6
      list_rental
    when 7
      exit
    else
      puts 'Please pick a number from the list!'
    end
  end
end
