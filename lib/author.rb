class Author
attr_reader :books,
            :first, 
            :last

  def initialize(information)
    @first = information[:first_name]
    @last = information[:last_name]
    @books = []
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
    @books << book
    book
  end
end
