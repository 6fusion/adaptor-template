# Do not modify this file
collection @machines if @machines.present?
object @machine if @machine.present?
extends 'machines/base'

_interval = params[:interval].blank? ? 300 : params[:interval]
_since = params[:since].blank? ? 5.minutes.ago.utc : Time.iso8601(params[:since])
_until = params[:until].blank? ? Time.now.utc : Time.iso8601(params[:until])

child disks: :disks do
  extends 'machines/disks'

  node :readings do |r|
    r.readings(@inode, _interval, _since, _until).map do |r|
      {
        usage:     r.usage,
        read:      r.read,
        write:     r.write,
        date_time: r.date_time
      }
    end
  end
end

child nics: :nics do
  extends 'machines/nics'

  node :readings do |r|
    r.readings(@inode, _interval, _since, _until).map do |r|
      {
        date_time: r.date_time,
        receive:   r.receive,
        transmit:  r.transmit
      }
    end
  end
end

node :readings do |o|
  o.readings(@inode, _interval, _since, _until).map do |r|
    {
      interval:     r.interval,
      date_time:    r.date_time,
      cpu_usage:    r.cpu_usage,
      memory_bytes: r.memory_bytes
    }
  end
end