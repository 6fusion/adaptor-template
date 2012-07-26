require 'spec_helper'

describe INode do
  before :each do
    @inode = INode.new(
      uuid: "1234",
      connection: "https://api.service_provider.com",
      credentials: Hash.new(
        username: "username",
        password: "password"
      ).to_json
    )
  end

  it "should have a uuid" do
    @inode.uuid.should_not be_blank
  end

  it "should have a connection" do
    @inode.connection.should_not be_blank
  end

  it "should have a credentials" do
    @inode.credentials.should_not be_blank
  end

  context "#find_by_uuid" do
    before :each do
      mock_file_obj = mock("My Mock File") do
        stubs(:some_instance_method).returns("foo")
      end

      File.stubs(:exists?).returns(true)
      File.stubs(:zero?).returns(false)
      File.stubs(:open).returns(mock_file_obj)

      @inode =	INode.find_by_uuid("foo")
    end

    it "should return an INode" do
      @inode.is_a?(INode)
    end
  end

  # context "#capabilities" do
  #   before :each do
  #     @capabilities = @inode.capabilities
  #   end

  #   it "should return a CapabilityCollection" do
  #     @capabilities.is_a?(CapabilityCollection)
  #   end
  # end

  # context "#hosts" do
  #   before :each do
  #     @hosts = @inode.hosts
  #   end

  #   it "should return a HostCollection" do
  #     @hosts.is_a?(HostCollection)
  #   end
  # end

  # context "#machines" do
  #   before :each do
  #     @machines = @inode.machines
  #   end

  #   it "should return a MachineCollection" do
  #     @machines.is_a?(MachineCollection)
  #   end
  # end
end
