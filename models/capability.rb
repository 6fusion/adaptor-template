class Capability < Base::Capability
  # Custom Implementation that should return a list of capabilities for an iNode
  #
  # @param [INode] i_node instance that defines where the action is to take place
  # @see INode
  # @return [Array] Array of objects of type Capability
  def self.all(i_node)
    logger.info('Capability.all')
    capabilities = Array.new

    1.upto(5) do |i|
      capability = Capability.new(
        name: "#{i} Capability on #{i_node.connection}"
      )

      capabilities << capability
    end

    capabilities
  end
end