require 'spec_helper'

describe GildedRose do

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

end