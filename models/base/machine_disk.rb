class Base::MachineDisk < Main
  # @api public
  attr_accessor :uuid,
                :name,
                :maximum_size,
                :type

  def readings(i_node, _since = Time.now.utc.beginning_of_month, _until = Time.now.utc)
    logger.info('Base::MachineDisk.readings')
    raise Exceptions::NotImplemented
  end
end