# @api public
#  Possible capabilities include:
#
#  |--------------------+----------------------------------|
#  | capability         | requires                         |
#  |:-------------------|:---------------------------------|
#  | power_on           | guest_inventory                  |
#  | power_off          | guest_inventory                  |
#  | unplug             | guest_inventory                  |
#  | restart            | guest_inventory                  |
#  | suspend            | guest_inventory                  |
#  | resume             | guest_inventory                  |
#  | guest_state        | none                             |
#  | guest_inventory    | guest_state                      |
#  | host_state         | none                             |
#  | host_inventory     | host_state                       |
#  | guest_reading      | none                             |
#  | guest_metering     | guest_inventory, guest_reading   |
#  | host_reading       | none                             |
#  | host_metering      | host_inventory, host_reading     |
#  | create             | guest_inventory                  |
#  | delete             | guest_inventory                  |
#  | clone              | guest_inventory                  |
#  | edit               | guest_inventory                  |
#  | move               | guest_inventory & host_inventory |
#  | take_snapshot      | guest_inventory                  |
#  | revert_to_snapshot | guest_inventory                  |
#  | assign_ip          | guest_inventory                  |
#  | unassign_ip        | guest_inventory                  |
#  | import             | create                           |
#  | export             | guest_inventory                  |
#  |--------------------+----------------------------------|
#
#  Each of these capabilities may be implemented individually so long as the required
#  capabilities have also been implemented.
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
