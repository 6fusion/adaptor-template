# @api public
# This class file should not be modified if you don't understand what you are doing.
class Base::Medium < Main
    attr_accessor :network_interfaces_attributes

  def self.find_by_descriptor_file(_infrastructure_node, _descriptor_file_location)
    logger.info("Medium.find_by_descriptor_file")
    # get descriptor file

    # parse descriptor file

    # Build errors and warnings

    # figure out nic details

    # return medium model
  end

  # TODO: Test this method, and finish building
  def self.delete(_infrastructure_node, _medium_location)
    media_info_files = Dir.glob("#{_medium_location}/*.media_info")
    inode_media_info_file = media_info_files.select { |e| e == "#{File.join(_medium_location, _infrastructure_node.uuid)}.media_info" }.first

    if inode_media_info_file.present?
      delete_cmd = ""
      if media_info_files.count > 1
        # if the media is associated with any other inodes than the one we are removing, just remove the media_info file
        delete_cmd = "rm #{inode_media_info_file}"
      else
        # if the media is no longer associated with any inodes remove the directory, and all contents
        delete_cmd = "rm -rf #{_medium_location}"
      end
      logger.info("executing: #{delete_cmd}")
      Kernel.system(delete_cmd)
      logger.info("completed: #{delete_cmd}")
    end
  end
end
