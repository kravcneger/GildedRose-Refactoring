require 'calculators/calculator'

class AgedBrieCalculator < Calculator

  def update_quality
    item.quality += 1 if item.quality < max_quality
    item.sell_in -= 1
  end
end