require 'spec_helper'

describe CommonCalculator do  
  let(:calculator){ CommonCalculator.new(item)}
  
  describe "#update_quality" do
    before { calculator.update_quality }

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
  
end