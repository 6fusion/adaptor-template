class Base::MachineDiskReading < Main
  # @api public
  attr_accessor :usage,
                :read,
                :write,
                :date_time

  validates :usage,
    :numericality => { :only_integer => true, :greater_than_or_equal_to => 0 }
  validates :read,
    :numericality => { :only_integer => true, :greater_than_or_equal_to => 0 }
  validates :write,
    :numericality => { :only_integer => true, :greater_than_or_equal_to => 0 }
end