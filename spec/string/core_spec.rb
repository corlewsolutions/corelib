require 'spec_helper'

describe String do

  describe "#combine" do
    it 'defaults work' do
      "test".combine("test2").should == "test test2"
      "".combine("test2").should=="test2"
      "test".combine("").should == "test"
      "test".combine("me", "out").should == "test me out"
    end
    it "setting prefix & suffix works" do
      "test".combine("me", :prefix => "(").should == "(test me"
      "test".combine("me", :suffix => ")").should == "test me)"
      "test".combine("me", :prefix => "(", :suffix => ")").should == "(test me)"
      "test".combine("me", :prefix => "(", :suffix => ")", :wrap => false).should == "test me"
    end
    it "if_empty option works" do
      "".combine("", :if_empty => "-").should == "-"
    end
  end
end
