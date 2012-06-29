class MachineDisk < Base
  attr_accessor :uuid,
                :name,
                :maximum_size,
                :type

  include Implementor::MachineDisk
end