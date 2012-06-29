class MachineDisk < Base::MachineDisk
  def readings(i_node, _since = Time.now.utc.beginning_of_month, _until = Time.now.utc)
    logger.info('machine_disk.readings')

    readings = Array.new
    1.upto(2) do |j|
      reading = MachineDiskReading.new(
        usage: 32*1024*1024,
        read:  16*1024,
        write: 8*1024
      )

      readings << reading
    end

    readings
  end
end