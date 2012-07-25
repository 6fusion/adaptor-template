class Host < Base::Host
  def self.all(i_node)
    logger.info('Host.all')
    raise Exceptions::NotImplemented
  end

  def self.find_by_uuid(i_node, uuid)
    logger.info('Host.find_by_uuid')
    raise Exceptions::NotImplemented
  end

  def readings(i_node, uuid)
    logger.info('Host.readings')
    raise Exceptions::NotImplemented
  end
end
