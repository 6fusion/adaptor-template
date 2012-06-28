module Implementor::Capability
  extends_host_with :ClassMethods

  # Implement Singleton/Class Methods Here
  module ClassMethods
    def all(i_node)
      logger.info('Capability.all.start')
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
end