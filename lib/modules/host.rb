module Implementor::Host
  extends_host_with :ClassMethods

  module ClassMethods
    def all(i_node)
      logger.info('Host.all')
      raise Exceptions::NotImplemented
    end

    def find_by_uuid(i_node, uuid)
      logger.info('Host.find_by_uuid')
      raise Exceptions::NotImplemented
    end
  end

  def readings(i_node, uuid)
    logger.info('host.readings')
    raise Exceptions::NotImplemented
  end
end