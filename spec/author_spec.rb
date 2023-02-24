
The `write` method must take two Strings as arguments and return an instance of `Book`.
require 'rspec'
require './lib/book'
require './lib/author'

RSpec.describe Author do
  describe '#initialize' do
    it 'can initialize' do
    charlotte_bronte = Author.new({first_name: "Charlotte", last_name: "Bronte"})

    expect(author).to be_a(Author)
    end
  end

  describe 'has proper attribues' do
    it 'has name' do
    charlotte_bronte = Author.new({first_name: "Charlotte", last_name: "Bronte"})

    expect(charlotte_bronte.name).to eq("Charlotte Bronte")
    end

    it 'has books' do
    charlotte_bronte = Author.new({first_name: "Charlotte", last_name: "Bronte"})

    expect(charlotte_bronte.books).to eq([])
    end
  end

  describe 'can write books' do
    it 'can write book' do
    charlotte_bronte = Author.new({first_name: "Charlotte", last_name: "Bronte"})
    jane_eyre = charlotte_bronte.write("Jane Eyre", "October 16, 1847")

    expect(jane_eyre).to be_a(Book)
    end

    it 'has proper attribues' do
    charlotte_bronte = Author.new({first_name: "Charlotte", last_name: "Bronte"})
    jane_eyre = charlotte_bronte.write("Jane Eyre", "October 16, 1847")

    expect(jane_eyre.class).to be_a(Book)
    expect(jane_eyre).title.to eq("Jane Eyre")
    end

    it 'can write multiple books' do
    charlotte_bronte = Author.new({first_name: "Charlotte", last_name: "Bronte"})
    jane_eyre = charlotte_bronte.write("Jane Eyre", "October 16, 1847")
    villette = charlotte_bronte.write("Villette", "1853")

    expect(charlotte_bronte.books).to eq([jane_eyre, villette])
    end
  end
end


