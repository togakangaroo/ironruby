require File.dirname(__FILE__) + '/../../spec_helper'
require 'syslog'

describe "Syslog.ident" do
  not_supported_on :windows do

    before :each do
      Syslog.opened?.should be_false
    end

    after :each do
      Syslog.opened?.should be_false
    end

    it "returns the logging identity" do
      Syslog.open("rubyspec")
      Syslog.ident.should == "rubyspec"
      Syslog.close
    end
    
    it "returns nil if the log is closed" do
      Syslog.opened?.should == false
      Syslog.ident.should == nil
    end

    it "defaults to $0" do
      Syslog.open
      Syslog.ident.should == $0
      Syslog.close
    end
  end
end
