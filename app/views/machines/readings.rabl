# Do not modify this file
collection @machines if @machines.present?
object @machine if @machine.present?
extends 'machines/base'
child(:readings) do
  attributes :machine_uuid,
             :interval,
             :date_time,
             :cpu,
             :memory,
             :disk_io,
             :lan_io,
             :wan_io,
             :storage
end