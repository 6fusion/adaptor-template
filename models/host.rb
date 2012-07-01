# @api public
class Host < Base::Host
  # Should return a list of all Hosts on an iNode
  #
  # @param [INode] i_node iNode instance that defines where the action is to take place
  # @return [Array<Host>]
  def self.all(i_node)
    logger.info('Host.all')
    raise Exceptions::NotImplemented
  end

  # Should return a specific Host for an iNode
  #
  # @param [INode] i_node iNode instance that defines where the action is to take place
  # @return [Host]
  def self.find_by_uuid(i_node, uuid)
    logger.info('Host.find_by_uuid')
    raise Exceptions::NotImplemented
  end

  # Should return a list of all readings for a specific Host
  #
  # @param [INode] i_node iNode instance that defines where the action is to take place
  # @return [Array<HostReading>]
  def readings(i_node, uuid)
    logger.info('Host.readings')
    raise Exceptions::NotImplemented
  end
end
