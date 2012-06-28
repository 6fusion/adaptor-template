module Implementor::Host
  extends_host_with :ClassMethods

  module ClassMethods
    def all()
      logger.info('Host.all')
      raise Exceptions::NotImplemented
    end

    def find_by_uuid(uuid)
      logger.info('Host.find_by_uuid')
      raise Exceptions::NotImplemented
    end
  end

  def readings(uuid)
    logger.info('host.readings')
    raise Exceptions::NotImplemented
  end
end