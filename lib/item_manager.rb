class ItemManager
  def initialize
    @brands = {
      "Sulfuras, Hand of Ragnaros" => SulfurasCalculator, 
      "Aged Brie" => AgedBrieCalculator,
      "Backstage passes to a TAFKAL80ETC concert" => BackStagePasses,
      "Conjured" => ConjuredCalculator
    }
    @calculators_instances = {}
    @common_calculator ||= CommonCalculator.new
  end

  def update_quality item
    calculator = @common_calculator
    @brands.each do |name,cal|
      if name == item.name
        @calculators_instances[name] ||= cal.new
        calculator = @calculators_instances[name]
      end
    end
    calculator.item = item
    calculator.update_quality
  end

end