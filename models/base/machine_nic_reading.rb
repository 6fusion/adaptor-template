class Base::MachineNicReading < Main
  # @api public
  attr_accessor :receive,
                :transmit

  validates :receive,
    :numericality => { :only_integer => true, :greater_than_or_equal_to => 0 }
  validates :transmit,
    :numericality => { :only_integer => true, :greater_than_or_equal_to => 0 }
end