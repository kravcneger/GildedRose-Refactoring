require 'calculators/calculator'

class CommonCalculator < Calculator

  def update_quality
	if item.sell_in > 0
	  change_quality_by(-1)
	else
	  change_quality_by(-2)
	end
	item.sell_in -= 1
  end
end