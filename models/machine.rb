class Machine < Base
  attr_accessor :uuid,
                :name,
                :cpu_count,
                :cpu_speed,
                :maximum_memory,
                :system,
                :disks,
                :nics,
                :guest_agent,
                :power_state

  include Implementor::Machine
end