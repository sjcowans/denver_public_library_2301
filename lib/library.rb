class Library
attr_reader :name,
            :authors,
            :books

  def initialize(name)
    @name = name
    @books = []
    @authors = []
    @checked_out_books = []
    @checkout_counter = []
  end

  def add_author(author)
    @books.concat(author.books)
    @authors << author
  end

  def publication_time_frame_for(author)
    time_frame = {}
    time_frame[:start] = author.book_years.first
    time_frame[:end] = author.book_years.last
    time_frame
  end

  def checkout(book)
    @checkout_counter << book
    @books.delete(book)
    @checked_out_books << book
  end

  def return(book)
    @books << book
    @checked_out_books.delete(book)
    if @checked_out_book == nil
      @checked_out_books = []
    end
  end

  def most_checked_out
    @checkout_counter.group_by do |book|
      book
    end.values.max_by(&:size).first
  end
end
