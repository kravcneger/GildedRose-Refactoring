require 'calculators/calculator'

class BackStagePasses < Calculator

  def update_quality
    case
    when item.sell_in < 1
      item.quality = 0
    when item.sell_in <= 5
      change_quality_by(3)
    when item.sell_in <= 10
      change_quality_by(2)
    else
      change_quality_by(1)
    end
    item.sell_in -= 1
  end
end