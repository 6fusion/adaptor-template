module Implementor::Capability
  extends_host_with :ClassMethods

  # Implement Singleton/Class Methods Here
  module ClassMethods
    def all()
      logger.info('Capability.all')
      capabilities = Array.new

      1.upto(5) do |i|
        capability = Capability.new(
          name: "My Only Capability"
        )

        capabilities << capability
      end

      capabilities
    end
  end
end