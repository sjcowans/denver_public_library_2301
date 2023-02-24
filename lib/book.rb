class Book
  attr_reader :title

  def initialize(information)
    @first = information[:author_first_name]
    @last = information[:author_last_name]
    @title = information[:title]
    @date = information[:publication_date]
  end

  def author
    @first + (" ") + @last
  end

  def publication_year
    @date.split(" ").last
  end
end
