class Capability < Base::Capability

  SUPPORTED_CAPABILITIES = ['guest_inventory',
                            'guest_metering']

  def self.all(inode)
    logger.info('Capability.all')
    SUPPORTED_CAPABILITIES.map do |capability|
      Capability.new(name: capability)
    end
  end
end
