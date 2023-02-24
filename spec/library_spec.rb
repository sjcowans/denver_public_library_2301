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

    it 'can put publication timeframe' do
    library = Library.new("Seanbrary")
    charlotte_bronte = Author.new({first_name: "Charlotte", last_name: "Bronte"})
    villette = charlotte_bronte.write("Villette", "1853")
    why_planes_fly = charlotte_bronte.write("Why Planes Fly", "1854")
    up = charlotte_bronte.write("Up", "1955")
    sean_cowans = Author.new({first_name: "Sean", last_name: "Cowans"})
    code_like_a_pro = sean_cowans.write("Code Like a Pro", "2023")
    why_tho = sean_cowans.write("Why tho?", "2022")
    surviving_covid = sean_cowans.write("Survivnfg Covid", "2021")
    library.add_author(charlotte_bronte)
    library.add_author(sean_cowans)

    expect(library.publication_time_frame_for(sean_cowans)).to eq({:end=>"2023", :start=>"2021"})
    end
  end

  describe 'can checkout books' do
    it 'can checkout books' do
    library = Library.new("Seanbrary")
    charlotte_bronte = Author.new({first_name: "Charlotte", last_name: "Bronte"})
    villette = charlotte_bronte.write("Villette", "1853")
    why_planes_fly = charlotte_bronte.write("Why Planes Fly", "1854")
    up = charlotte_bronte.write("Up", "1955")
    sean_cowans = Author.new({first_name: "Sean", last_name: "Cowans"})
    code_like_a_pro = sean_cowans.write("Code Like a Pro", "2023")
    why_tho = sean_cowans.write("Why tho?", "2022")
    surviving_covid = sean_cowans.write("Survivnfg Covid", "2021")
    library.add_author(charlotte_bronte)
    library.add_author(sean_cowans)
    library.checkout(why_tho)

    expect(library.checkout(surviving_covid)).to eq([why_tho, surviving_covid])
    end

    it 'can return books' do
    library = Library.new("Seanbrary")
    charlotte_bronte = Author.new({first_name: "Charlotte", last_name: "Bronte"})
    villette = charlotte_bronte.write("Villette", "1853")
    why_planes_fly = charlotte_bronte.write("Why Planes Fly", "1854")
    up = charlotte_bronte.write("Up", "1955")
    sean_cowans = Author.new({first_name: "Sean", last_name: "Cowans"})
    code_like_a_pro = sean_cowans.write("Code Like a Pro", "2023")
    why_tho = sean_cowans.write("Why tho?", "2022")
    surviving_covid = sean_cowans.write("Survivnfg Covid", "2021")
    library.add_author(charlotte_bronte)
    library.add_author(sean_cowans)
    library.checkout(why_tho)
    library.checkout(surviving_covid)
    library.return(why_tho)

    expect(library.checked_out_books).to eq([surviving_covid])
    expect(library.return(surviving_covid)).to eq([])
    end

    it 'can show most checked out book' do
    library = Library.new("Seanbrary")
    charlotte_bronte = Author.new({first_name: "Charlotte", last_name: "Bronte"})
    villette = charlotte_bronte.write("Villette", "1853")
    why_planes_fly = charlotte_bronte.write("Why Planes Fly", "1854")
    up = charlotte_bronte.write("Up", "1955")
    sean_cowans = Author.new({first_name: "Sean", last_name: "Cowans"})
    code_like_a_pro = sean_cowans.write("Code Like a Pro", "2023")
    why_tho = sean_cowans.write("Why tho?", "2022")
    surviving_covid = sean_cowans.write("Survivnfg Covid", "2021")
    library.add_author(charlotte_bronte)
    library.add_author(sean_cowans)
    library.checkout(why_tho)
    library.checkout(surviving_covid)
    library.return(why_tho)
    library.checkout(why_tho)
    
    expect(library.most_checked_out).to eq(why_tho)
    end
  end
end