require 'calculators/calculator'

class SulfurasCalculator < Calculator

  def update_quality
	item.quality = 80
  end

  protected def max_quality
    80
  end
end