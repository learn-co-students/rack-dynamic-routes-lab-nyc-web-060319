class Item
  attr_accessor :name, :price
  @@all = []
  def initialize(name,price)
    @name = name
    @price = price
    @@all << self
  end

  def self.find(item_name)
    @@all.find{ |item| item.name == item_name }
  end
end
