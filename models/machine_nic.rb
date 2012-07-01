# @api public
class MachineNic < Base::MachineNic
  # This is where you would call your cloud service and
  # find a specific machine's nic's readings.
  # This request should support since (start_date) and until (end_date)
  # 
  # @param [INode] i_node iNode instance that defines where the action is to take place
  # @param [Time] _since The beginning date/time for the requested readings
  # @param [Time] _until The ending date/time for the requested readings
  # @return [Machine]
  def readings(i_node, _since = Time.now.utc.beginning_of_month, _until = Time.now.utc)
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