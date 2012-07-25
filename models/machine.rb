# @api public
class Machine < Base::Machine
  # This is where you would call your cloud service and get a list of machines
  #
  # @param [INode] inode iNode instance that defines where the action is to take place
  # @return [Array<Machine>]
  def self.all(inode)
    logger.info('Machine.all')
    machines = Array.new

    1.upto(5) do |i|
      # Hydrate a Machine object
      machine = Machine.new(
        uuid:             'aaaaaaaa-aaaa-aaaa-aaaa-aaaaaaaaaaa' + i.to_s,
        name:             i.to_s + ':My Fake Machine',
        cpu_count:        rand(4),
        cpu_speed:        rand(2000),
        maximum_memory:   32*1024*1024,
        system:           build_system(),
        disks:            build_disks(),
        nics:             build_nics(),
        guest_agent:      true,
        power_state:      'poweredOn'
      )

      # Add the Machine object to the @machines array
      machines << machine
    end

    machines
  end

  # This is where you would call your cloud service and find the machine matching
  # the uuid passed.
  #
  # @param [INode] inode iNode instance that defines where the action is to take place
  # @param [String] uuid The specific identifier for the Machine
  # @return [Machine]
  def self.find_by_uuid(inode, uuid)
    logger.info('Machine.find_by_uuid')
    machine = Machine.new(
      uuid:             uuid,
      name:             'My Fake Machine',
      cpu_count:        rand(4),
      cpu_speed:        rand(2000),
      maximum_memory:   32*1024*1024,
      system:           build_system(),
      disks:            build_disks(),
      nics:             build_nics(),
      guest_agent:      true,
      power_state:      'poweredOn'
    )

    machine
  end

  # This is where you would call your cloud service and
  # find a specific machine's readings.
  # This request should support since (start_date) and until (end_date)
  #
  # @param [INode] inode iNode instance that defines where the action is to take place
  # @param [Time] _since The beginning date/time for the requested readings
  # @param [Time] _until The ending date/time for the requested readings
  # @return [Machine]
  def readings(inode, _since = Time.now.utc.beginning_of_month, _until = Time.now.utc)
    logger.info('machine.readings')

    readings = Array.new
    1.upto(5) do |i|
      reading = MachineReading.new(
        interval:     3600,
        date_time:    Time.at((_until.to_f - _since.to_f) * rand + _since.to_f),
        cpu_usage:    1400,
        memory_bytes: rand(32) * 1024 * 1024
      )

      readings << reading
    end

    readings
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

  private
  # Template Helper Method. Can be deleted
  def self.build_system()
    logger.info('Machine.build_system')

    MachineSystem.new(
      architecture:     "x64",
      operating_system: "Linux"
    )
  end

  # Template Helper Method. Can be deleted
  def self.build_disks()
    logger.info('Machine.build_disks')

    machine_disks = Array.new
    1.upto(2) do |i|
      machine_disk = MachineDisk.new(
        uuid:         "aaaaaaaa-aaaa-aaaa-aaaa-aaaaaaaaaaa#{i}",
        name:         "#{i}:My Fake Disk",
        maximum_size: 32*1024*1024,
        type:         'Disk'
      )

      machine_disks << machine_disk
    end

    machine_disks
  end

  # Template Helper Method. Can be deleted
  def self.build_nics()
    logger.info('Machine.build_nics')

    machine_nics = Array.new
    1.upto(2) do |i|
      machine_nic = MachineNic.new(
        uuid:        "aaaaaaaa-aaaa-aaaa-aaaa-aaaaaaaaaaa#{i}",
        name:        "#{i}:My Fake Nic",
        mac_address: "A0:B0:C0:D0:E0:F0:G0:H#{i}",
        ip_address:  "192.168.1.#{i}"
      )

      machine_nics << machine_nic
    end

    machine_nics
  end
end
