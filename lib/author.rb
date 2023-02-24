class Author
attr_reader :books,
            :first, 
            :last,
            :book_years

  def initialize(information)
    @first = information[:first_name]
    @last = information[:last_name]
    @books = []
    @book_years = []
  end

  def name
    @first + " " + @last
  end

  def write(name, date)
    data = {}
    data[:author_first_name] = @first
    data[:author_last_name] = @last
    data[:title] = name
    data[:publication_date] = date
    book = Book.new(data)
    @book_years << book.publication_year
    @book_years.sort!
    @books << book
    book
  end
end
