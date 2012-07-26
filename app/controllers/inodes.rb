AdaptorTemplate.controllers :inodes, :priority => :low do
  # Creates
  post :index do
    logger.info('POST - inodes#index')

    inode = INode.new(params)
    inode.save
  end

  # Reads

  # Updates

  # Deletes
end