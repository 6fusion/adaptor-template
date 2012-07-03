class Base::MachineDisk < Main
  # @api public
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

  def readings(i_node, _since = Time.now.utc.beginning_of_month, _until = Time.now.utc)
    logger.info('Base::MachineDisk.readings')
    raise Exceptions::NotImplemented
  end
end
