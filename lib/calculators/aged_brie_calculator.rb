require 'calculators/calculator'

class AgedBrieCalculator < Calculator

  def update_quality
    change_quality_by(1)
    item.sell_in -= 1
  end
end