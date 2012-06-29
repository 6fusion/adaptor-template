class Host < Base
  attr_accessor :uuid,
                :name,
                :ip_address,
                :cpu_count,
                :cpu_speed,
                :total_memory,
                :status

  include Implementor::Host
end