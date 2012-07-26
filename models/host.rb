class Host < Base::Host
  def self.all(inode)
    logger.info('Host.all')
    raise Exceptions::NotImplemented
  end

  def self.find_by_uuid(inode, uuid)
    logger.info('Host.find_by_uuid')
    raise Exceptions::NotImplemented
  end

  def readings(inode, uuid)
    logger.info('Host.readings')
    raise Exceptions::NotImplemented
  end
end
