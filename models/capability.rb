# @api public
# @example Possible capabilities include:
#  Each of these capabilities are to be implemented individually
#
#  |--------------------+----------------------------------|
#  | capability         | currently supported              |
#  |:-------------------|:---------------------------------|
#  | add                | yes                              |
#  | start              | yes                              |
#  | stop               | yes                              |
#  | restart            | yes                              |
#  | force_stop         | yes                              |
#  | force_restart      | yes                              |
#  | delete             | yes                              |
#  | edit               | no                               |
#  | suspend            | no                               |
#  | resume             | no                               |
#  | unplug             | no                               |
#  | clone              | no                               |
#  | take_snapshot      | no                               |
#  | revert_to_snapshot | no                               |
#  |--------------------+----------------------------------|
#
class Capability < Base::Capability

  SUPPORTED_CAPABILITIES = ['guest_inventory',
                            'guest_metering']

  # Should return a list of capabilities for an iNode
  #
  # @param [INode] i_node iNode instance that defines where the action is to take place
  # @return [Array<Capability>]
  def self.all(i_node)
    logger.info('Capability.all')
    SUPPORTED_CAPABILITIES.map do |capability|
      Capability.new(name: capability)
    end
  end
end
