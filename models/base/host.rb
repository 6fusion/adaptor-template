# @api public
class Base::Host < Main
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

  # Should return a list of all Hosts on an iNode
  #
  # @param [INode] i_node iNode instance that defines where the action is to take place
  # @return [Array<Host>]
  def self.all(i_node)
    logger.info('Base::Host.all')
    raise Exceptions::NotImplemented
  end

  # Should return a specific Host for an iNode
  #
  # @param [INode] i_node iNode instance that defines where the action is to take place
  # @return [Host]
  def self.find_by_uuid(i_node, uuid)
    logger.info('Base::Host.find_by_uuid')
    raise Exceptions::NotImplemented
  end

  # Should return a list of all readings for a specific Host
  #
  # @param [INode] i_node iNode instance that defines where the action is to take place
  # @return [Array<HostReading>]
  def readings(i_node, uuid)
    logger.info('Base::Host.readings')
    raise Exceptions::NotImplemented
  end
end
