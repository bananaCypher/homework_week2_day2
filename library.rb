class Library
  attr_reader :name, :books, :people
  def initialize(name)
    @name = name
    @books = {}
    @people = {}
    @borrowed = {}
  end

  def add_book(book)
    @books[book.title] = book
  end

  def list_books
    if @books.empty?
      "There are no books in the library at present"
    else
      @books.map { |key, book| book.pretty_string }.join("\n")
    end
  end

  def add_person(person)
    @people[person.name] = person
  end

  def list_people
    if @people.empty?
      "No people here"
    else
      @people.map { |key, person| person.pretty_string }.join("\n")
    end
  end

  def lend(person_name, book_title)
    person = @people[person_name]
    book = @books.delete(book_title)
    @borrowed[book.title] = person
    person.borrow(book)
  end

  def return(person_name, book_title)
    person = @people[person_name]
    book = person.return(book_title)
    @borrowed.delete(book.title)
    add_book(book)
  end

  def list_borrowed_books
    books = @people.map { |key, person| person.list_books }.join
    if books.empty?
      "There are no borrowed books"
    else
      books
    end
  end  
  def who_has(book_title)
      person = @borrowed[book_title]
      return person.name if person != nil
      "nobody"
  end
end
