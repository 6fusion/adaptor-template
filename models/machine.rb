class Machine < Base::Machine
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

  def readings(inode, _interval = 300, _since = Time.now.utc.beginning_of_month, _until = Time.now.utc)
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
        type:         'Disk',
        thin:         'true',
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
