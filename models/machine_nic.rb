class MachineNic < Base
  attr_accessor :uuid,
                :name,
                :mac_address,
                :ip_address

  include Implementor::MachineNic
end