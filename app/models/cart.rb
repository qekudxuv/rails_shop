class Cart
  attr_reader :items

  def initialize
    @items = []
  end

  def total_price
    total = @items.inject(0) { |sum, item| sum + item.price }
  end

  def add_item(id)
    item = @items.find { |item| item.item_id == id }
    if item
      item.increment_quantity
    else
      @items << CartItem.new(id)
    end
  end

  def empty?
    @items.empty?
  end

end
