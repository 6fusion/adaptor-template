# Do not modify this file
collection @hosts if @hosts.present?
object @host if @host.present?
extends 'hosts/base'
child(:readings) do
  attributes :host_uuid,
             :interval,
             :date_time,
             :cpu,
             :memory,
             :disk_io,
             :lan_io,
             :wan_io,
             :storage
end