require 'spec_helper'

describe "CapabilitiesController" do
  before do
    get "/inodes/aaaaaaaa-aaaa-aaaa-aaaa-aaaaaaaaaaa1/capabilities"
  end
  
  it "returns hello world" do
    last_response.body.should == "Hello World"
  end
end