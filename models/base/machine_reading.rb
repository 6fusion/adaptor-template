class Base::MachineReading < Main
  # @api public
  attr_accessor :interval,
                :date_time,
                :cpu_usage,
                :memory_bytes
end