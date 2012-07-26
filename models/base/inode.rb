# @api public
# This class file should not be modified if you don't understand what you're doing.
class Base::INode < Main
  # Should return details for a specific iNode
  #
  # @param [String] uuid The specific identifier for the iNode
  # @return [INode]
  def self.find_by_uuid(uuid)
    logger.info('Base::INode.find_by_uuid')

    inode_file_path = "#{PADRINO_ROOT}/data/#{uuid}.json"
    logger.info inode_file_path
    if !File.exists?(inode_file_path) || File.zero?(inode_file_path)
      raise Exceptions::NotFound
    else
      File.open(inode_file_path, "r") do |file_handle|
        self.new(ActiveSupport::JSON.decode(file_handle))
      end
    end
  end

  # Should save the details of the current iNode
  #
  # @return [nil]
  def save()
    logger.info('Base::INode.save')

    inode_file_path = "#{PADRINO_ROOT}/data/#{self.uuid}.json"
    File.open(inode_file_path, "w") do |file_handle|
      file_handle.write(self.to_json)
    end
  end
end
