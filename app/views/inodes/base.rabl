attribute :uuid
attribute :release_version
attribute :host_ip_address

child :capabilities => :capabilities do
  attribute :name
end
child :networks => :networks do
  attribute :uuid
  attribute :discovered_name
  attribute :is_accessible
  attribute :ip_pool_name
end
node :data_stores do |inode|
  inode.datastores.map { |ds| {
      uuid: ds["moref_id"],
      name: ds["name"],
      kind: ds["type"],
      max_file_size_bytes: ds["max_file_size"],
      free_space_bytes: ds["free_space"],
      url: ds["url"],
      remote_path: ds["remote_path"],
      remote_host: ds["remote_host"]
    }
  }
end