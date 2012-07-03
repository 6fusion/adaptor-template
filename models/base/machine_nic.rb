class Base::MachineNic < Main
  # @api public
  attr_accessor :uuid,
                :name,
                :mac_address,
                :ip_address

  def readings(i_node, _since = Time.now.utc.beginning_of_month, _until = Time.now.utc)
    logger.info('Base::MachineNic.readings')
    raise Exceptions::NotImplemented
  end
end