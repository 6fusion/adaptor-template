# @api public
# This class file should not be modified if you don't understand what you're doing.
class INode < Base::INode
  # Should return details for a specific iNode
  #
  # @param [String] uuid The specific identifier for the iNode
  # @return [INode]
  def self.find_by_uuid(uuid)
    logger.info('INode.find_by_uuid')

    super
  end

  # Should save the details of the current iNode
  #
  # @return [nil]
  def save()
    logger.info('INode.save')

    super
  end
end