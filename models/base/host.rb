class Base::Host < Main
  # @api public
  attr_accessor :uuid,
                :name,
                :ip_address,
                :cpu_count,
                :cpu_speed,
                :total_memory,
                :status

  def self.all(i_node)
    logger.info('Base::Host.all')
    raise Exceptions::NotImplemented
  end

  def self.find_by_uuid(i_node, uuid)
    logger.info('Base::Host.find_by_uuid')
    raise Exceptions::NotImplemented
  end

  def readings(i_node, uuid)
    logger.info('Base::Host.readings')
    raise Exceptions::NotImplemented
  end
end