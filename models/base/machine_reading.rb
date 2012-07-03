class Base::MachineReading < Main
  # @api public
  attr_accessor :interval,
                :date_time,
                :cpu_usage,
                :memory_bytes

  validates :interval,
    :presence => true
  validates :date_time,
    :presence => true
  validates :cpu_usage,
    :numericality => { :only_integer => true, :greater_than_or_equal_to => 0 }
  validates :memory_bytes,
    :numericality => { :only_integer => true, :greater_than_or_equal_to => 0 }
end