require 'spec_helper'

describe SulfurasCalculator do  
  let(:calculator){ SulfurasCalculator.new(item)}
  
  describe "#update_quality" do
    before { calculator.update_quality }

    context "sell_in not expired" do
      let(:item){ Item.new("item",20,20) }
      it { expect(item.quality).to eq 20 }
      it { expect(item.sell_in).to eq 20 }
    end
  end
end