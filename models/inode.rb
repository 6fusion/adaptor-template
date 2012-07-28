class INode < Base::INode
  def self.find_by_uuid(uuid)
    logger.info('INode.find_by_uuid')

    super
  end

  def update(uuid, params)
    logger.info('INode.update')

    super
  end

  def save(uuid)
    logger.info('INode.save')

    super
  end

  def delete(uuid)
    logger.info('INode.delete')

    super
  end
end