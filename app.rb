require './book'
require './rental'
require './student'
require './teacher'
require './person'

def list_books
  if @books.empty?
    puts " No books added !!\n"
  else
    @books.each do |_id, book|
      puts "Id: #{book.id}  Title: #{book.title}  Author: #{book.author}"
    end
  end
end

def list_people
  if @people.empty?
    puts " No Data !! \n"
  else
    @people.each do |_id, person|
      puts "Id: #{person.id}  Name: #{person.name}  Age: #{person.age}"
    end
  end
end

def list_rental
  if @rentals.empty?
    puts " Person did not rent any book  \n"
  else
    puts ' Enter Id of a person'
    id = gets.chomp.to_i
    print " Person did not rent any book  \n" if @rentals[id].nil?
    @rentals[id].each do |rental|
      puts "On #{rental.date}, #{rental.book.title} book is rented by #{rental.person.name}"
    end
  end
end

def create_person
  puts "Do you want to create a \n1 Student or \n2 Teacher"
  option = gets.chomp.to_i

  case option
  when 1
    create_student
  when 2
    create_teacher
  else
    puts "Choose either 1 for Student or 2 for teacher\n Wrong choice!!\n"
  end
end

def create_student
  print 'Age: '
  age = gets.chomp
  print 'Name: '
  name = gets.chomp
  print 'Has parent permission? [Y/N]: '
  parent_permission = gets.chomp
  parent_permission.upcase!

  case parent_permission
  when 'Y'
    parent_permission = true
  when 'N'
    parent_permission = false
  else
    print 'Input is either Y or N'
  end
  id = rand(1...10_000)
  student = Student.new(id, age, name: name, parent_permission: parent_permission)
  @people[id] = student
  puts "Student is added successfully!! \n"
end

def create_teacher
  print 'Age: '
  age = gets.chomp
  print 'Name: '
  name = gets.chomp
  print 'Specialization: '
  specialization = gets.chomp
  id = rand(1...10_000)
  teacher = Teacher.new(id, age, specialization, name: name)
  @people[id] = teacher
  puts "Teacher is added successfully !!\n"
end

def create_book
  print 'Title: '
  title = gets.chomp
  print 'Author: '
  author = gets.chomp

  id = rand(1...10_000)
  book = Book.new(id, title, author)
  @books[id] = book
  puts "Book is added successfully !!\n"
end

def create_rental
  list_books
  print 'Book Id: '
  book_id = gets.chomp.to_i

  list_people
  print 'Person Id: '
  person_id = gets.chomp.to_i

  print 'Date: '
  date = gets.chomp

  rental = Rental.new(date, @books[book_id], @people[person_id])

  @rentals[person_id].nil? ? @rentals[person_id] = [rental] : @rentals[person_id].push(rental)

  puts "Rental created successfully !!\n"
end

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
