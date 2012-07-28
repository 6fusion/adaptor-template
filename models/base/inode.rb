# @api public
# This class file should not be modified if you don't understand what you're doing.
class Base::INode < Main
  # Should return details for a specific iNode
  #
  # @param [String] uuid The identifier for the iNode
  # @return [INode]
  def self.find_by_uuid(uuid)
    logger.info("Base::INode.find_by_uuid(#{uuid})")

    inode_file_path = "#{PADRINO_ROOT}/data/#{uuid}.json"
    if !File.exists?(inode_file_path) || File.zero?(inode_file_path)
      raise Exceptions::NotFound
    else
      File.open(inode_file_path, "r") do |file_handle|
        self.new(ActiveSupport::JSON.decode(file_handle))
      end
    end
  end

  # Should update the details of the current iNode
  #
  # @param [String] uuid The identifier for the iNode
  # @param [Hash] params A hash of configuraton parameters for the iNode
  # @return [nil]
  def update(uuid, params)
    logger.info("Base::INode.update(#{uuid})")

    params.each do |k, v|
      instance_variable_set("@#{k}", v) unless v.nil?
    end

    save(uuid)
  end

  # Should save the details of the current iNode
  #
  # @param [String] uuid The identifier for the iNode
  # @return [nil]
  def save(uuid)
    logger.info("Base::INode.save(#{uuid})")

    inode_file_path = "#{PADRINO_ROOT}/data/#{uuid}.json"
    File.open(inode_file_path, "w") do |file_handle|
      file_handle.write(self.to_json)
    end
  end

  # Should delete the current iNode
  #
  # @param [String] uuid The identifier for the iNode
  # @return [nil]
  def delete(uuid)
    logger.info("Base::INode.delete(#{uuid})")

    inode_file_path = "#{PADRINO_ROOT}/data/#{uuid}.json"
    File.delete(inode_file_path) if File.exists?(inode_file_path)
  end
end
