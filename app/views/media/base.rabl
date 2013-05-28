# Do not modify this file
node :network_interfaces_attributes do
  @medium.network_interfaces_attributes.map { |e| { :name => e[:name] } }
end