# Do not modify this file
collection @machines if @machines.present?
object @machine if @machine.present?
extends 'machines/base'
node :readings do |o|
  _since = params[:since].blank? ? Time.now.utc.beginning_of_month : params[:since]
  _until = params[:until].blank? ? Time.now.utc : params[:until]
  
  o.readings(@i_node, _since, _until).map do |i|
    {
      :interval => i.interval,
      :date_time => i.date_time,
      :cpu => i.cpu,
      :memory => i.memory,
      :disk_io => i.disk_io,
      :lan_io => i.lan_io,
      :wan_io => i.wan_io,
      :storage => i.storage
    }
  end
end