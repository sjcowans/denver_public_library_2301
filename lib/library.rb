class Library
attr_reader :name,
            :authors,
            :books

  def initialize(name)
    @name = name
    @books = []
    @authors = []
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
end
