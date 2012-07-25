# @api public
class Base::MachineNicReading < Main
  attr_accessor :receive,
                :transmit,
                :date_time

  validates :receive,
    :numericality => { :only_integer => true, :greater_than_or_equal_to => 0 }
  validates :transmit,
    :numericality => { :only_integer => true, :greater_than_or_equal_to => 0 }
end