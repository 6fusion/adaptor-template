# @api public
# This class file should not be modified if you don't understand what you are doing.
class Base::MediaStore < Main
  attr_accessor :local_path,
    :remote_path

  def self.mount(_data_center_id, _local_mount_path, _remote_mount_path, _engine_room)
    logger.info("creating local mount path: #{_local_mount_path}")
    Kernel.system("sudo mkdir -p #{_local_mount_path}")
    logger.info("created local mount path: #{_local_mount_path}")

    logger.info("backing up /etc/fstab to /etc/fstab.bkp.#{Time.now.strftime("%Y-%m-%dT%H_%M_%S")}")
    backup_cmd = "sudo cp /etc/fstab /etc/fstab.bkp.#{Time.now.strftime("%Y-%m-%dT%H_%M_%S")}"
    logger.info("backup_cmd: #{backup_cmd}")
    Kernel.system(backup_cmd)
    logger.info("/etc/fstab backed up")

    logger.info("adding mount to /etc/fstab to it will persist on reboot")
    mount_point = "#{_remote_mount_path} #{_local_mount_path} nfs rw,sync 0 0"
    automount_cmd = "grep \"#{mount_point}\" /etc/fstab > /dev/null || echo #{mount_point} | sudo tee -a /etc/fstab"
    logger.info("automount_cmd: #{automount_cmd}")
    Kernel.system(automount_cmd)
    logger.info("mount added to /etc/fstab for persistence")

    logger.info("mounting #{_remote_mount_path} -> #{_local_mount_path}")
    mount_cmd = "sudo mount -t nfs #{_remote_mount_path} #{_local_mount_path} -o tcp"
    logger.info("#{mount_cmd}")
    Kernel.system(mount_cmd)
    logger.info("mounted: #{_local_mount_path}")

    logger.info("creating engine room auth token file for #{_engine_room[:uuid]}")
    token_cmd = "mkdir -p #{_local_mount_path}/engine-room-tokens && echo -n '#{_engine_room[:token]}' > #{_local_mount_path}/engine-room-tokens/#{_data_center_id}.token"
    Kernel.system(token_cmd)
    logger.info("engine room auth token created")

    return self.new({ local_path: _local_mount_path, remote_path: _remote_mount_path })
  end

  def self.unmount(_data_center_id, _local_mount_path)
    logger.info("removing engine room auth token")
    token_cmd = "rm -f #{_local_mount_path}/engine-room-tokens/#{_data_center_id}.token"
    Kernel.system(token_cmd)
    logger.info("engine room auth token removed")

    logger.info("unmounting #{_local_mount_path}")
    Kernel.system("sudo umount #{_local_mount_path}")
    logger.info("unmounted #{_local_mount_path}")

    logger.info("deleting local mount directory: #{_local_mount_path}")
    Kernel.system("sudo rmdir #{_local_mount_path}")
    logger.info("deleted local mount directory: #{_local_mount_path}")

    return self.new({ local_path: _local_mount_path, remote_path: '' })
  end
end
