class Base::Capability < Main
  attr_accessor :name

  def self.all(i_node)
    logger.info('Base::Capability.all')
    raise Exceptions::NotImplemented
  end
end
