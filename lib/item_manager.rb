class ItemManager
  def initialize
    @brands = {
		"Sulfuras, Hand of Ragnaros" => SulfurasCalculator, 
		"Aged Brie" => AgedBrieCalculator,
		"Backstage passes to a TAFKAL80ETC concert" => BackStagePasses,
		"Conjured" => ConjuredCalculator
	}
  end

  def update_quality item
    calculator = CommonCalculator.new(item)
    @brands.each do |name,cal|
      if name == item.name
        calculator = cal.new(item)
      end
    end
    calculator.update_quality
  end

end