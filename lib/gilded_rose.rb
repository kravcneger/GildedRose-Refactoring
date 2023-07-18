require_relative 'calculators/aged_brie'
require_relative 'calculators/backstage_passes'
require_relative 'calculators/calculator'
require_relative 'calculators/common'
require_relative 'calculators/conjured'
require_relative 'calculators/sulfuras'
require_relative 'item_manager'

class GildedRose

  def initialize(items)
    @items = items
  end

  def update_quality
    item_manager = ItemManager.new
    @items.each do |item|
      item_manager.update_quality(item)
    end
  end
end

class Item
  attr_accessor :name, :sell_in, :quality

  def initialize(name, sell_in, quality)
    @name = name
    @sell_in = sell_in
    @quality = quality
  end

  def to_s()
    "#{@name}, #{@sell_in}, #{@quality}"
  end
end
