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
