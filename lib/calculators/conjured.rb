require 'calculators/calculator'

class ConjuredCalculator < Calculator

  def update_quality
    if item.sell_in > 0
      change_quality_by(-2)
    else
      change_quality_by(-4)
    end
    item.sell_in -= 1
  end
end