class Base::DataStore < Main
  attr_accessor :uuid,
    :discovered_name,
    :kind,
    :max_file_size_bytes,
    :free_space_bytes,
    :url,
    :remote_path,
    :remote_host
end
