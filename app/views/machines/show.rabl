# Do not modify this file
object @machine
extends 'machines/base'
child :disks => :disks do
  extends 'machines/disks'
end
child :nics => :nics do
  extends 'machines/nics'
end