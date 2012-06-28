module Enumerators
  mattr_accessor :disk_type,
                 :machine_status,
                 :task_status

  @@disk_type = {
    :disk  => 'Disk',
    :cdrom => 'CD'
  }

  @@machine_status = {
    deploying:     'Deploying',
    restart:       'Restart',
    snapshot:      'Snapshot',
    unplug:        'Unplug',
    powered_off:   'poweredOff',
    halted:        'poweredOff',
    powered_on:    'poweredOn',
    running:       'poweredOn',
    powering_off:  'PoweringOff',
    powering_on:   'PoweringOn',
    shutting_down: 'PoweringOff',
    deleting:      'Deleting',
    deleted:       'Deleted',
    reconfiguring: 'Reconfiguring',
    paused:        'poweredOff',
    suspended:     'poweredOff'
  }

  @@task_status = {
    :queued           => 0,
    :processing       => 1,
    :complete         => 2,
    :failed           => 3,
    :no_machine_found => 4,
    :inapplicable     => 5,
    :not_implemented  => 6,
    :error            => 7
  }
end
