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

  describe "#to_bool" do
    it 'converts to true correctly' do
      "true".to_bool.should == true
      "TRUE".to_bool.should == true
      "t".to_bool.should == true
      "T".to_bool.should == true
      "1".to_bool.should == true
      "yes".to_bool.should == true
      "YES".to_bool.should == true
    end
    it 'converts to false correctly in unstrict mode' do
      "false".to_bool.should == false
      "r".to_bool.should == false
      "0".to_bool.should == false
      "Chuck Norris".to_bool.should == false
      "".to_bool.should == false
    end
    it 'converts correctly when using no_strip' do
      "false".to_bool(:strip => false).should == false
      "true".to_bool(:strip => false).should == true
      "true  ".to_bool(:strip => false).should == false
      "  1  ".to_bool(:strip => false).should == false
    end
    it 'converts to false correctly in strict mode' do
      "false".to_bool(:strict => true).should == false
      "FAlSE".to_bool(:strict => true).should == false
      "f".to_bool(:strict => true).should == false
      "F".to_bool(:strict => true).should == false
      "0".to_bool(:strict => true).should == false
      "".to_bool(:strict => true).should == false
      "    ".to_bool(:strict => true).should == false
    end
    it 'throws an error when not true and not strictly "false"' do
      expect{ "blah".to_bool(:strict => true) }.to raise_error(ArgumentError)
    end
  end

  describe "#to_yes_no" do
    it 'converts correctly with no options' do
      "false".to_yes_no.should == "No"
      "FALSE".to_yes_no.should == "No"
      "  FALSE  ".to_yes_no.should == "No"
      "f".to_yes_no.should == "No"
      "F".to_yes_no.should == "No"
      "".to_yes_no.should == "No"
      "   ".to_yes_no.should == "No"
      "0".to_yes_no.should == "No"
      "true".to_yes_no.should == "Yes"
      "TRUE".to_yes_no.should == "Yes"
      "t".to_yes_no.should == "Yes"
      "T".to_yes_no.should == "Yes"
      "1".to_yes_no.should == "Yes"
      "  1  ".to_yes_no.should == "Yes"
    end
    it 'converts correctly with format options' do
      "false".to_yes_no(:format => "Up").should == "NO"
      "false".to_yes_no(:format => "Down").should == "no"
      "true".to_yes_no(:format => "Up").should == "YES"
      "true".to_yes_no(:format => "Down").should == "yes"
    end
  end

  describe "#concat_with" do
    it 'appends correctly' do
      "".concat_with("test").should == "test"
      "".concat_with("test",",").should == "test"
      "my".concat_with("test").should == "mytest"
      "my".concat_with("test",",").should == "my,test"
    end
    it 'does not append separators with nil or empty strings' do
      "my".concat_with("",",").should == "my"
      "my".concat_with(nil,",").should == "my"
      "".concat_with("",",").should == ""
      "".concat_with(nil,",").should == ""
    end
    it 'does not create a new string' do
      str = ""
      str_id = str.object_id
      new_str = str.concat("test")
      new_str.object_id.should == str_id
    end
  end

  describe "#index_of_next_space_from" do
    it 'calculates correctly with no trailing whitespace' do
      str = "This is string"
      str.index_of_next_space_from(0).should == 4
      str.index_of_next_space_from(5).should == 7
      str.index_of_next_space_from(8).should == 14
    end
    it 'calculates correctly with trailing whitespace' do
      str = "This is string  "
      str.index_of_next_space_from(10).should == 14
      str.index_of_next_space_from(14).should == 15
    end
  end
  describe "#not_empty?" do
    it "works" do
      "".not_empty?.should == false
      "test".not_empty?.should == true
    end
  end
end