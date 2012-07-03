class Base::Host < Main
  # @api public
  attr_accessor :uuid,
    :name,
    :ip_address,
    :cpu_count,
    :cpu_speed,
    :total_memory,
    :status

  validates :uuid,
    :presence => true,
    :length => { :maximum => 40 }
  validates :name,
    :presence => true,
    :length => { :maximum => 50 }
  validates :ip_address,
    :presence => true,
    :length => { :maximum => 15 }
  validates :cpu_count,
    :numericality => { :only_integer => true, :greater_than => 0 }
  validates :cpu_speed,
    :numericality => { :greater_than => 0 }
  validates :total_memory,
    :numericality => { :only_integer => true, :greater_than => 0 }
  validates :status,
    :presence => true

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
