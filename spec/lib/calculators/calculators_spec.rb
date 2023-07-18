require 'spec_helper'

describe Calculator do
  let(:item){ Item.new("item",10,10) }
  let(:calculator){ Calculator.new(item)}

  describe "#new" do
    it { expect { Calculator.new(1) }.to raise_error(ArgumentError) }
  end

  describe "#update_quality" do
    it { expect { calculator.update_quality }.to raise_error(NotImplementedError) }
  end

end