module Fusion
  class Reading < Fusion::Base
    attr_accessor :machine_uuid,
                  :interval,
                  :date_time,
                  :cpu,
                  :memory,
                  :disk_io,
                  :lan_io,
                  :wan_io,
                  :storage
  end
end