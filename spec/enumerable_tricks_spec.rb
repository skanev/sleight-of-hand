require File.join(File.dirname(__FILE__), 'spec_helper')
require 'sleight_of_hand/enumerable_tricks'

describe "Enumerbable extensions" do
  it "should allow array.*.method invocations" do
    %w{Sleight of hand}.*.length.should == [7, 2, 4]
    [1, -7, 2, -9].*.abs.should == [1, 7, 2, 9]
    [42, :symbol, 'String', {}].*.respond_to?(:succ).should == [true, false, true, false]
  end

  it "should allow array.select.method invocations" do
    [42, 3.14, 1729, 2.71].select.integer?.should == [42, 1729]
    ([1, -7, 2, -9].select > 0).should == [1, 2]
    [42, :symbol, 'String', {}].select.respond_to?(:succ).should == [42, 'String']

    # Should have a kinky / alias
    [42, 3.14, 1729, 2.71]./.integer?.should == [42, 1729]
  end
end

