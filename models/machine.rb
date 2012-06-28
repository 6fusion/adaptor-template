class Machine < Base
  attr_accessor :uuid,
                :name,
                :host_name,
                :available_memory,
                :operating_system,
                :status

  validates :uuid,
            :presence => true
  validates :name,
            :presence => true,
            :length   => { :maximum => 50 }
  validates :host_name,
            :presence => true
  validates :available_memory,
            :presence => true
  validates :operating_system,
            :presence => true
  validates :status,
            :presence => true

  include Implementor::Machine
end