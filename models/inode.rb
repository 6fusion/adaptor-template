class INode < Base::INode
  def self.find_by_uuid(uuid)
    logger.info("INode.find_by_uuid(#{uuid})")

    super
  end

  def update(uuid, params)
    logger.info("INode.update(#{uuid})")

    super
  end

  def save(uuid)
    logger.info("INode.save(#{uuid})")

    super
  end

  def delete(uuid)
    logger.info("INode.delete(#{uuid})")

    super
  end
end