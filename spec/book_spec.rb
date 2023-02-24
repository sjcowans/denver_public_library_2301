require 'rspec'
require './lib/book'

RSpec.describe Book do
  describe '#initialize' do
    it 'can initialize' do
    book = Book.new({author_first_name: "Harper", author_last_name: "Lee", title: "To Kill a Mockingbird", publication_date: "July 11, 1960"})

    expect(book).to be_a(Book)
    end
  end

  describe 'has proper attributes' do
    it 'has title' do
    book = Book.new({author_first_name: "Harper", author_last_name: "Lee", title: "To Kill a Mockingbird", publication_date: "July 11, 1960"})

    expect(book.title).to eq("To Kill a Mockingbird")
    end

    it 'has author' do
    book = Book.new({author_first_name: "Harper", author_last_name: "Lee", title: "To Kill a Mockingbird", publication_date: "July 11, 1960"})

    expect(book.author).to eq("Harper Lee")
    end

    it 'has publication year' do
    book = Book.new({author_first_name: "Harper", author_last_name: "Lee", title: "To Kill a Mockingbird", publication_date: "July 11, 1960"})

    expect(book.publication_year).to eq("1960")
    end
  end
end

