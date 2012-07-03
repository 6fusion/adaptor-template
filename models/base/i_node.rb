class Base::INode < Main
  # @api public
  attr_accessor :uuid,
    :connection,
    :credentials

  def self.find_by_uuid(uuid)
    logger.info('Base::INode.find_by_uuid')

    i_node_file_path = "#{PADRINO_ROOT}/data/#{uuid}.json"
    logger.info i_node_file_path
    if !File.exists?(i_node_file_path) || File.zero?(i_node_file_path)
      raise Exceptions::NotFound
    else
      File.open(i_node_file_path, "r") do |file_handle|
        self.new(ActiveSupport::JSON.decode(file_handle))
      end
    end
  end

  def save()
    logger.info('Base::INode.save')

    i_node_file_path = "#{PADRINO_ROOT}/data/#{self.uuid}.json"
    File.open(i_node_file_path, "w") do |file_handle|
      file_handle.write(self.to_json)
    end
  end
end
