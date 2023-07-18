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

  protected def max_quality
    50
  end
end