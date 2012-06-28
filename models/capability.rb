class Capability < Base
  attr_accessor :name

  def self.all()
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