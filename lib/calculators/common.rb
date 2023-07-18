require 'calculators/calculator'

class CommonCalculator < Calculator

  def update_quality
	if item.sell_in > 0
		item.quality -= 1 if item.quality > 0
	else
	  if item.quality > 1
        item.quality -= 2
	  else
	    item.quality = 0
	  end
	end
	item.sell_in -= 1
  end
end