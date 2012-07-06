require 'spec_helper'

describe INode do
  before :each do
    @i_node = INode.new(
      uuid: "1234",
      connection: "https://api.service_provider.com",
      credentials: Hash.new(
        username: "username",
        password: "password"
      ).to_json
    )
  end

  it "should have a uuid" do
    @i_node.uuid.should_not be_blank
  end

  it "should have a connection" do
    @i_node.connection.should_not be_blank
  end

  it "should have a credentials" do
    @i_node.credentials.should_not be_blank
  end

  context "#find_by_uuid" do
    before :each do
      mock_file_obj = mock("My Mock File") do
        stubs(:some_instance_method).returns("foo")
      end

      File.stubs(:exists?).returns(true)
      File.stubs(:zero?).returns(false)
      File.stubs(:open).returns(mock_file_obj)

      @i_node =	INode.find_by_uuid("foo")
    end

    it "should return an INode" do
      @i_node.is_a?(INode)
    end
  end

  # context "#capabilities" do
  #   before :each do
  #     @capabilities = @i_node.capabilities
  #   end

  #   it "should return a CapabilityCollection" do
  #     @capabilities.is_a?(CapabilityCollection)
  #   end
  # end

  # context "#hosts" do
  #   before :each do
  #     @hosts = @i_node.hosts
  #   end

  #   it "should return a HostCollection" do
  #     @hosts.is_a?(HostCollection)
  #   end
  # end

  # context "#machines" do
  #   before :each do
  #     @machines = @i_node.machines
  #   end

  #   it "should return a MachineCollection" do
  #     @machines.is_a?(MachineCollection)
  #   end
  # end
end
