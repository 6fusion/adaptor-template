# @api public
class MachineDisk < Base::MachineDisk
  # This is where you would call your cloud service and
  # find a specific machine's disk's readings.
  # This request should support since (start_date) and until (end_date)
  # 
  # @param [INode] i_node iNode instance that defines where the action is to take place
  # @param [Time] _since The beginning date/time for the requested readings
  # @param [Time] _until The ending date/time for the requested readings
  # @return [Machine]
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