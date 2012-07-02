require 'spec_helper'

describe "HostsController" do
  before do
    get 'i_nodes/aaaaaaaa-aaaa-aaaa-aaaa-aaaaaaaaaaa1/hosts'
  end

  it "returns with success" do
    last_response.status.should == 200
  end

  it "returns capability array" do
    capabilities = Array.new(ActiveSupport::JSON.decode(last_response.body))
    capabilities.each do |capability_json|
      Capability.new(ActiveSupport::JSON.decode(capability_json.to_json))
    end
  end
end
