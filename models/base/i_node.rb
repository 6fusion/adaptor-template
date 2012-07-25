class Base::INode < Main
  # @api public

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

  def save()
    logger.info('Base::INode.save')

    inode_file_path = "#{PADRINO_ROOT}/data/#{self.uuid}.json"
    File.open(inode_file_path, "w") do |file_handle|
      file_handle.write(self.to_json)
    end
  end
end
