class Capability < Base
  attr_accessor :name

  include Implementor::Capability
end