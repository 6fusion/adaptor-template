# @api public
class Base::Machine < Main
  attr_accessor :uuid,
    :name,
    :cpu_count,
    :cpu_speed,
    :maximum_memory,
    :system,
    :disks,
    :nics,
    :guest_agent

  # @example Possible machine power states include:
  #
  #  |--------------------|
  #  | power_state        |
  #  |:-------------------|
  #  | creating           |
  #  | restarting         |
  #  | starting           |
  #  | stopping           |
  #  | deleting           |
  #  | stopped            |
  #  | started            |
  #  | deleted            |
  #  |--------------------|
  attr_accessor :power_state

  validates :uuid,
    :presence => true,
    :length => { :maximum => 40 }
  validates :name,
    :presence => true
  validates :cpu_count,
    :numericality => { :only_integer => true, :greater_than => 0 }
  validates :cpu_speed,
    :numericality => { :greater_than => 0 }
  validates :maximum_memory,
    :numericality => { :only_integer => true, :greater_than => 0 }
  validates :guest_agent,
    :presence => true
  validates :power_state,
    :presence => true

  # This is where you would call your cloud service and get a list of machines
  #
  # @param [INode] inode iNode instance that defines where the action is to take place
  # @return [Array<Machine>]
  def self.all(inode)
    logger.info('Machine.all')
    raise Exceptions::NotImplemented
  end

  # This is where you would call your cloud service and find the machine matching
  # the uuid passed.
  #
  # @param [INode] inode iNode instance that defines where the action is to take place
  # @param [String] uuid The specific identifier for the Machine
  # @return [Machine]
  def self.find_by_uuid(inode, uuid)
    logger.info('Machine.find_by_uuid')
    raise Exceptions::NotImplemented
  end

  # This is where you would call your cloud service and
  # find a specific machine's readings.
  # This request should support interval (frequency), since (start_date), and until (end_date)
  #
  # @param [INode] inode iNode instance that defines where the action is to take place
  # @param [Integer] _interval The frequency the readins should be return for the requested date range
  # @param [Time] _since The beginning date/time for the requested readings
  # @param [Time] _until The ending date/time for the requested readings
  # @return [Machine]
  def readings(inode, _interval = 300, _since = Time.now.utc.beginning_of_month, _until = Time.now.utc)
    logger.info('machine.readings')
    raise Exceptions::NotImplemented
  end

  # Management
  # This is where you would call your cloud service and start a machine
  #
  # @param [INode] inode iNode instance that defines where the action is to take place
  # @return [nil]
  def start(inode)
    logger.info("machine.start")
    raise Exceptions::NotImplemented
  end

  # This is where you would call your cloud service and stop a machine
  #
  # @param [INode] inode iNode instance that defines where the action is to take place
  # @return [nil]
  def stop(inode)
    logger.info("machine.stop")
    raise Exceptions::NotImplemented
  end

  # This is where you would call your cloud service and restart a machine
  #
  # @param [INode] inode iNode instance that defines where the action is to take place
  # @return [nil]
  def restart(inode)
    logger.info("machine.restart")
    raise Exceptions::NotImplemented
  end

  # This is where you would call your cloud service and force stop a machine
  #
  # @param [INode] inode iNode instance that defines where the action is to take place
  # @return [nil]
  def force_stop(inode)
    logger.info("machine.force_stop")
    raise Exceptions::NotImplemented
  end

  # This is where you would call your cloud service to create a new virtual machine
  #
  # @param [INode] inode iNode instance that defines where the action is to take place
  # @return [nil]
  def save(inode)
    logger.info("machine.save")
    raise Exceptions::NotImplemented
  end

  # This is where you could call your cloud service to delete a virtual machine
  #
  # @param [INode] inode iNode instance that defines where the action is to take place
  # @return [nil]
  def delete(inode)
    logger.info("machine.delete")
    raise Exceptions::NotImplemented
  end
end
