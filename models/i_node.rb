class INode < Base::INode
  def self.find_by_uuid(uuid)
    logger.info('INode.find_by_uuid')

    super
  end

  def save()
    logger.info('INode.save')

    super
  end
end