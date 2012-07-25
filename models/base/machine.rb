class Base::Machine < Main
  # @api public
  attr_accessor :uuid,
    :name,
    :cpu_count,
    :cpu_speed,
    :maximum_memory,
    :system,
    :disks,
    :nics,
    :guest_agent

  # @api public
  # @example Possible machine power states include:
  #
  #  |--------------------|
  #  | power_state        |
  #  |:-------------------|
  #  | adding             |
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

  def self.all(inode)
    logger.info('Machine.all')
    raise Exceptions::NotImplemented
  end

  def self.find_by_uuid(inode, uuid)
    logger.info('Machine.find_by_uuid')
    raise Exceptions::NotImplemented
  end

  def readings(inode, _since = Time.now.utc.beginning_of_month, _until = Time.now.utc)
    logger.info('machine.readings')
    raise Exceptions::NotImplemented
  end

  def start(inode)
    logger.info("machine.start")
    raise Exceptions::NotImplemented
  end

  def stop(inode)
    logger.info("machine.stop")
    raise Exceptions::NotImplemented
  end

  def restart(inode)
    logger.info("machine.restart")
    raise Exceptions::NotImplemented
  end

  def force_stop(inode)
    logger.info("machine.force_stop")
    raise Exceptions::NotImplemented
  end

  def save(inode)
    logger.info("machine.save")
    raise Exceptions::NotImplemented
  end

  def delete(inode)
    logger.info("machine.delete")
    raise Exceptions::NotImplemented
  end
end
