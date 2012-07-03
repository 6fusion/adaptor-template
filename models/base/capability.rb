class Base::Capability < Main
  # @api public
  attr_accessor :name

  validates :name,
    :presence => true

  def self.all(i_node)
    logger.info('Base::Capability.all')
    raise Exceptions::NotImplemented
  end
end
