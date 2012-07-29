# @api public
class Base::MachineNic < Main
  attr_accessor :uuid,
    :name,
    :mac_address,
    :ip_address

  validates :uuid,
    :presence => true,
    :length => { :maximum => 40 }
  validates :name,
    :presence => true,
    :length => { :maximum => 100 }
  validates :mac_address,
    :length => { :maximum => 40 }
  validates :ip_address,
    :length => { :maximum => 40 }

  # This is where you would call your cloud service and
  # find a specific machine's nic's readings.
  # This request should support interval (frequency), since (start_date), and until (end_date)
  #
  # @param [INode] inode iNode instance that defines where the action is to take place
  # @param [Integer] _interval The frequency the readins should be return for the requested date range
  # @param [Time] _since The beginning date/time for the requested readings
  # @param [Time] _until The ending date/time for the requested readings
  # @return [Machine]
  def readings(inode, _interval = 300, _since = Time.now.utc.beginning_of_month, _until = Time.now.utc)
    logger.info('Base::MachineNic.readings')
    raise Exceptions::NotImplemented
  end
end
