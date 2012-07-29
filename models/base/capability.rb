# @api public
# @example Possible capabilities include:
#  Each of these capabilities are to be implemented individually
#
#  |--------------------+-------------------------+-----------------------------------------------------------------------------------------|
#  | capability         | currently supported     | description                                                                             |
#  |:-------------------|:------------------------|:----------------------------------------------------------------------------------------|
#  | machines           | yes                     | gets a list of machines on the iNode                                                    |
#  | machines_readings  | yes                     | gets a list of machines with readings for a given time period                           |
#  | machine            | yes                     | gets machine by uuid on an iNode                                                        |
#  | machine_readings   | yes                     | gets machine by uuid with readings for a given time period                              |
#  | create             | no                      | creates a machine on the iNode with the given details                                   |
#  | start              | yes                     | sends an OS signal to start or powers on a specific machine by uuid on the iNode        |
#  | stop               | yes                     | sends an OS signal to stops or powers off a specific machine by uuid on the iNode       |
#  | restart            | yes                     | sends an OS signal to restarts a specific machine by uuid on the iNode                  |
#  | force_stop         | yes                     | stops machine by uuid on the iNode as if the power button were pressed                  |
#  | force_restart      | yes                     | same as force_stop excepts starts the machine back up after it is stopped               |
#  | delete             | yes                     | deletes machine by uuid on an iNode                                                     |
#  | update             | no                      | updates machine by uuid on an iNode with the given details                              |
#  | pause              | no                      |                                                                                         |
#  | resume             | no                      |                                                                                         |
#  | clone              | no                      |                                                                                         |
#  | take_snapshot      | no                      |                                                                                         |
#  | revert_to_snapshot | no                      |                                                                                         |
#  |--------------------+-------------------------+-----------------------------------------------------------------------------------------|
class Base::Capability < Main
  attr_accessor :name

  validates :name,
    :presence => true

  # Should return a list of capabilities for an iNode
  #
  # @param [INode] inode iNode instance that defines where the action is to take place
  # @return [Array<Capability>]
  def self.all(inode)
    logger.info('Base::Capability.all')
    raise Exceptions::NotImplemented
  end
end
