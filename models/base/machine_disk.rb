# @api public
class Base::MachineDisk < Main
  attr_accessor :uuid,
    :name,
    :maximum_size,
    :type

  validates :uuid,
    :presence => true,
    :length => { :maximum => 40 }
  validates :name,
    :presence => true
  validates :maximum_size,
    :numericality => { :only_integer => true, :greater_than => 0 }
  validates :type,
    :inclusion => { :in => %(Disk CD) }

  # This is where you would call your cloud service and
  # find a specific machine's disk's readings.
  # This request should support since (start_date) and until (end_date)
  #
  # @param [INode] i_node iNode instance that defines where the action is to take place
  # @param [Time] _since The beginning date/time for the requested readings
  # @param [Time] _until The ending date/time for the requested readings
  # @return [Machine]
  def readings(i_node, _since = Time.now.utc.beginning_of_month, _until = Time.now.utc)
    logger.info('Base::MachineDisk.readings')
    raise Exceptions::NotImplemented
  end
end
