# Do not modify this file
collection @machines if @machines.present?
object @machine if @machine.present?
extends 'machines/base'

_since = params[:since].blank? ? Time.now.utc.beginning_of_month : params[:since]
_until = params[:until].blank? ? Time.now.utc : params[:until]

child :disks => :disks do
  extends 'machines/disks'

 node :readings do |r|
   r.readings(@i_node, _since, _until).map do |r|
     {
       :usage => r.usage,
       :read => r.read,
       :write => r.write
     }
   end
 end
end

child :nics => :nics do
  extends 'machines/nics'

 node :readings do |r|
   r.readings(@i_node, _since, _until).map do |r|
     {
       :receive => r.receive,
       :transmit => r.transmit
     }
   end
 end
end

node :readings do |o|
  o.readings(@i_node, _since, _until).map do |r|
    {
      :interval => r.interval,
      :date_time => r.date_time,
      :cpu_usage => r.cpu_usage,
      :memory_bytes => r.memory_bytes
    }
  end
end