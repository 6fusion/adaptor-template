class Base::MachineNic < Main
  # @api public
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

  def readings(i_node, _since = Time.now.utc.beginning_of_month, _until = Time.now.utc)
    logger.info('Base::MachineNic.readings')
    raise Exceptions::NotImplemented
  end
end
