require 'spec_helper'

describe Object do
  describe "#not_nil?" do
    it 'works' do
      [].not_nil?.should == true
    end
  end
end