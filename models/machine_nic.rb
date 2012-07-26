class MachineNic < Base::MachineNic
  def readings(inode, _since = Time.now.utc.beginning_of_month, _until = Time.now.utc)
    logger.info('MachineNic.readings')

    readings = Array.new
    1.upto(2) do |j|
      reading = MachineNicReading.new(
        receive: 8*1024,
        transmit:  16*1024
      )

      readings << reading
    end

    readings
  end
end