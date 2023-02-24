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

  describe 'can add author' do
    it 'can list authors' do
    library = Library.new("Seanbrary")
    charlotte_bronte = Author.new({first_name: "Charlotte", last_name: "Bronte"})
    sean_cowans = Author.new({first_name: "Sean", last_name: "Cowans"})
    library.add_author(charlotte_bronte)
    library.add_author(sean_cowans)

    expect(library.authors).to eq([charlotte_bronte, sean_cowans])
    end

    it 'can add authors books' do
    library = Library.new("Seanbrary")
    charlotte_bronte = Author.new({first_name: "Charlotte", last_name: "Bronte"})
    villette = charlotte_bronte.write("Villette", "1853")
    sean_cowans = Author.new({first_name: "Sean", last_name: "Cowans"})
    code_like_a_pro = sean_cowans.write("Code Like a Pro", "2023")
    library.add_author(charlotte_bronte)
    library.add_author(sean_cowans)

    expect(library.books).to eq([villette, code_like_a_pro])
    end
  end
end