class Calculator
  protected attr_accessor :item

  def initialize(item)
    unless item.kind_of? Item
     raise ArgumentError, 'Argument should be an even subtype of Item'
    end
    @item = item
  end

  def update_quality
   raise NotImplementedError, "ERROR: update_quality is not implemented"
  end

  protected def change_quality n
    if @item.quality + n > max_quality
      @item.quality = max_quality
    elsif  @item.quality + n < 0
      @item.quality = 0
    else
      @item.quality += n
    end
  end

  protected def max_quality
    50
  end
end