require 'rails_helper'

RSpec.describe Webpage, type: :model do

  it 'is valid with valid attributes' do
  	text = "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Duis tempor finibus metus et porta. Morbi ullamcorper lacus porttitor hendrerit vehicula. Nulla elementum ex massa, ut imperdiet nunc congue nec."
  	webpage = Webpage.new(title: "Google", description: "Site de pesquisa", body: text, author: "Larry Page", url: "www.google.com.br")
  	expect(webpage).to be_valid
  end
  it 'is not valid without an title' do
  	text = "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Duis tempor finibus metus et porta. Morbi ullamcorper lacus porttitor hendrerit vehicula. Nulla elementum ex massa, ut imperdiet nunc congue nec."
  	webpage = Webpage.new(title: nil, description: "Site de pesquisa", body: text, author: "Larry Page", url: "www.google.com.br")
  	expect(webpage).to_not be_valid
  end
  it 'is not valid without an description' do
  	text = "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Duis tempor finibus metus et porta. Morbi ullamcorper lacus porttitor hendrerit vehicula. Nulla elementum ex massa, ut imperdiet nunc congue nec."
  	webpage = Webpage.new(title: "Google", description: nil, body: text, author: "Larry Page", url: "www.google.com.br")
  	expect(webpage).to_not be_valid
  end
  it 'is not valid without a body' do
  	webpage = Webpage.new(title: "Google", description: "Site de pesquisa", body: nil, author: "Larry Page", url: "www.google.com.br")
  	expect(webpage).to_not be_valid
  end
  it 'is not valid without a author' do
  	text = "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Duis tempor finibus metus et porta. Morbi ullamcorper lacus porttitor hendrerit vehicula. Nulla elementum ex massa, ut imperdiet nunc congue nec."
  	webpage = Webpage.new(title: "Google", description: "Site de pesquisa", body: text, author: nil, url: "www.google.com.br")
  	expect(webpage).to_not be_valid
  end
  it 'is not valid without a url' do
  	text = "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Duis tempor finibus metus et porta. Morbi ullamcorper lacus porttitor hendrerit vehicula. Nulla elementum ex massa, ut imperdiet nunc congue nec."
  	webpage = Webpage.new(title: "Google", description: "Site de pesquisa", body: text, author: "Larry Page", url: nil)
  	expect(webpage).to_not be_valid
  end
end
