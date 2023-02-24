require 'rspec'
require './lib/book'
require './lib/author'
require './lib/library'

RSpec.describe Library do
  describe '#initialize' do
    it 'can initialize' do
    library = Library.new("Seanbrary")

    expect(library).to be_a(Library)
    end
  end
  
  describe 'has correct attributes' do
    it 'can list name' do
    library = Library.new("Seanbrary")

    expect(library.name).to eq("Seanbrary")
    end

    it 'can list books' do
    library = Library.new("Seanbrary")

    expect(library.books).to eq([])
    end

    it 'can list authors' do
    library = Library.new("Seanbrary")

    expect(library.authors).to eq([])
    end
  end
end