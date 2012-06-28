class Host < Base
  attr_accessor :uuid,
                :name,
                :host_name,
                :available_memory,
                :operating_system,
                :status

  include Implementor::Host
end