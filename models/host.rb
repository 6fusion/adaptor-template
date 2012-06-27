module Fusion
  class Host < Fusion::Base
    attr_accessor :uuid,
                  :name,
                  :host_name,
                  :available_memory,
                  :operating_system,
                  :status

    def self.all()
      logger.info('Host.all')
      raise Exceptions::NotImplemented
    end

    def self.find_by_uuid(uuid)
      logger.info('Host.find_by_uuid')
      raise Exceptions::NotImplemented
    end

    def readings(uuid)
      logger.info('host.readings')
      raise Exceptions::NotImplemented
    end
  end
end