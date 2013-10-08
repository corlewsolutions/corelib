require 'spec_helper'

describe Array do
  describe "#us_state_options" do
    it "has the right number of entries" do
       Array.us_state_options.size.should == 52
       Array.us_state_options(:blank => false).size.should == 51
    end
    it "returns the correct list" do
      Array.us_state_options[1][0].should == "Alabama"
      Array.us_state_options(:abbrev => true)[1][0].should == "AL"
    end
    it "formats correctly" do
      Array.us_state_options(:format => "Up")[1][0].should == "ALABAMA"
      Array.us_state_options(:format => "Down")[1][0].should == "alabama"
      Array.us_state_options(:format => "Cap")[1][0].should == "Alabama"
      Array.us_state_options(:format => "Up", :abbrev => true)[1][0].should == "AL"
      Array.us_state_options(:format => "Down", :abbrev => true)[1][0].should == "al"
      Array.us_state_options(:format => "Cap", :abbrev => true)[1][0].should == "Al"
    end
  end

  describe "#month_options" do
    it "has the right number of entries" do
      Array.month_options.size.should == 13
      Array.month_options(:blank => false).size.should == 12
    end
    it "returns the correct list" do
      Array.month_options[1][0].should == "January"
      Array.month_options(:abbrev => true)[1][0].should == "Jan"
    end
    it "formats correctly" do
      Array.month_options(:format => "Up")[1][0].should == "JANUARY"
      Array.month_options(:format => "Down")[1][0].should == "january"
      Array.month_options(:format => "Cap")[1][0].should == "January"
      Array.month_options(:format => "Up", :abbrev => true)[1][0].should == "JAN"
      Array.month_options(:format => "Down", :abbrev => true)[1][0].should == "jan"
      Array.month_options(:format => "Cap", :abbrev => true)[1][0].should == "Jan"
    end
  end

  describe "#options_label_for" do
    it "returns the correct label" do
      Array.us_state_options.options_label_for("AK").should == "Alaska"
    end
    it "returns nil when nothing is found" do
      Array.us_state_options.options_label_for("invalid").should == nil
    end
  end

end