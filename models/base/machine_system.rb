class Base::MachineSystem < Main
  # @api public
  attr_accessor :architecture,
                :operating_system

  validates :architecture,
    :length => { :maximum => 32 }
  validates :operating_system,
    :length => { :maximum => 255 }
end