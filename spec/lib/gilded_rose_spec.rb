require 'spec_helper'

describe GildedRose do
  describe "Simple item" do
    before { GildedRose.new([item]).update_quality() }

    context "sell_in not expired" do
      let(:item){ Item.new("item",2,10) }
      it { expect(item.quality).to eq 9 }
      it { expect(item.sell_in).to eq 1 }
    end

    context "sell_in expired" do
      let(:item){ Item.new("item",0,10) }
      it { expect(item.quality).to eq 8 }
      it { expect(item.sell_in).to eq -1 }
    end

    context "checking for negative" do
      let(:item){ Item.new("item",0,0) }
      it { expect(item.quality).to eq 0 }
      it { expect(item.sell_in).to eq -1 }
    end
  end

  describe "Aged Brie" do
    before { GildedRose.new([item]).update_quality() }

    context "sell_in not expired" do
      let(:item){ Item.new("Aged Brie",2,10) }

      it { expect(item.quality).to eq 11 }
      it { expect(item.sell_in).to eq 1 }
    end

    context "sell_in expired" do
      let(:item){ Item.new("Aged Brie",0,10) }

      it { expect(item.quality).to eq 12 }
      it { expect(item.sell_in).to eq -1 }
    end

    context "checking for negative" do
      let(:item){ Item.new("Aged Brie",-0,0) }

      it { expect(item.quality).to eq 2 }
      it { expect(item.sell_in).to eq -1 }
    end
  
    context "max quality" do
      let(:item){ Item.new("Aged Brie",-1,50) }

      it { expect(item.quality).to eq 50 }
      it { expect(item.sell_in).to eq -2 }
    end
  end

  describe "Backstage passes to a TAFKAL80ETC concert" do
    let(:name){'Backstage passes to a TAFKAL80ETC concert'}
    before { GildedRose.new([item]).update_quality() }

    context "sell_in not expired" do
      let(:item){ Item.new(name,20,20) }
      it { expect(item.quality).to eq 21 }
      it { expect(item.sell_in).to eq 19 }
    end

    context "sell_in less than or equal 10" do
      let(:item){ Item.new(name,10,10) }
      it { expect(item.quality).to eq 12 }
      it { expect(item.sell_in).to eq 9 }
    end

    context "sell_in less than or equal 5" do
      let(:item){ Item.new(name,5,10) }
      it { expect(item.quality).to eq 13 }
      it { expect(item.sell_in).to eq 4 }
    end

    context "max quality" do
      let(:item){ Item.new(name,10,50) }
      it { expect(item.quality).to eq 50 }
    end
  end

  describe "Sulfuras" do
    let(:name){'Sulfuras, Hand of Ragnaros'}
    before { GildedRose.new([item]).update_quality() }

    context "sell_in not expired" do
      let(:item){ Item.new(name,20,20) }
      it { expect(item.quality).to eq 20 }
      it { expect(item.sell_in).to eq 20 }
    end
  
  end
end