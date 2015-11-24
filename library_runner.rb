require_relative('./library')
require_relative('./book')
require_relative('./person')

# TODO: create library
library = Library.new('CodeClan Library')

# TODO: create book
book_1 = Book.new({title: 'Errand', genre: 'Fantasy'})
library.add_book(book_1)
library.add_book(Book.new(title: "The Hobbit", genre: "Fantasy"))
library.add_book(Book.new(title: "Feersum Endjinn", genre: "Science Fiction"))
library.add_book(Book.new(title: "Histories", genre: "History"))
library.add_book(Book.new(title: "To Kill a Mockingbird", genre: "Fiction"))
library.add_book(Book.new(title: "A Brief History of Time", genre: "Non-Fiction"))

# TODO: list books
puts "All books\n#{library.list_books}"
puts "\n"

# TODO: create person
person_1 = Person.new('Callum')
library.add_person(person_1)
library.add_person(Person.new('Fred'))
library.add_person(Person.new('Wilma'))
library.add_person(Person.new('Barney'))
library.add_person(Person.new('Betty'))

# TODO: list people
puts "All people\n#{library.list_people}"
puts "\n"

# TODO: lend book
person_name = 'Wilma'
book_title = 'The Hobbit'
library.lend(person_name, book_title)
puts "All books\n#{library.list_books}"
puts "All people\n#{library.list_people}"
puts "\n"

# TODO: return book
library.return(person_name, book_title)
puts "All books\n#{library.list_books}"
puts "All people\n#{library.list_people}"
puts "\n"

# TODO: list borrowed books
puts "All borrowed books\n#{library.list_borrowed_books}"
puts "\n"

# Who has book borrowed?
puts "The person who has 'The Hobbit' borrowed is #{library.who_has('The Hobbit')}"

# Command line interface
def show_options
    puts "\n"
    puts "1. Add book to library\t\t2. List books in library"
    puts "3. Add person to library\t4. List all library memebers"
    puts "5. Lend book to person\t\t6. Return book from person"
    puts "7. List all borrowed books\t8. Find out who has a book"
    puts "0. Exit"
    print "What would you like to do? "
end

def option_1(library)
    print "What is the title of the book? "
    title = gets.strip
    print "What is the genre of the book? "
    genre = gets.strip
    book = Book.new({title: title, genre: genre})
    library.add_book(book)
    puts "#{book.title} has been added to the library."
end

def option_2(library)
    puts "All books\n#{library.list_books}"
end

def option_3(library)
    print "What is the name of the person you want to add to the library? "
    name = gets.strip
    person = Person.new(name)
    library.add_person(person)
    puts "#{person.name} has been added to the library."

end

def option_4(library)
    puts "All people\n#{library.list_people}"
end

def option_5(library)
    print "What is the name of the person borrowing the book? "
    person_name = gets.strip
    print "What is the title of the book being borrowed? "
    book_title = gets.strip 
    library.lend(person_name, book_title)
    puts "#{book_title} has been loaned to #{person_name}."
end

def option_6(library)
    print "What is the name of the person returning the book? "
    person_name = gets.strip
    print "What is the title of the book being returned? "
    book_title = gets.strip
    library.return(person_name, book_title)
    puts "#{book_title} has been returned to the library."
end

def option_7(library)
    puts "All borrowed books\n#{library.list_borrowed_books}"
end

def option_8(library)
    print "What is the title of the book you want to check? "
    book_title = gets.strip
    puts "The person who has '#{book_title}' borrowed is #{library.who_has(book_title)}"
end




answer = 1
while answer != 0 do
    show_options
    answer = gets.to_i
    case answer
        when 1
            option_1(library)
        when 2
            option_2(library)
        when 3
            option_3(library)
        when 4
            option_4(library)
        when 5
            option_5(library)
        when 6
            option_6(library)
        when 7
            option_7(library)
        when 8
            option_8(library)
    end
end
