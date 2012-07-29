AdaptorTemplate.controllers :inodes, :priority => :low do
  before do
    logger.info('inodes#before')
    content_type 'application/json'
  end

  # Creates
  post :index do
    logger.info('POST - inodes#index')

    uuid = params.delete('uuid')
    inode = INode.new(params)
    inode.save(uuid)
  end

  # Reads

  # Updates
  put :index do
    logger.info('PUT - inodes#index')

    if params.present?
      uuid = params.delete('uuid')
      inode = INode.find_by_uuid(uuid)
      inode.update(uuid, params) if params.present?
    end
  end

  # Deletes
  delete :index do
    logger.info('DELETE - inodes#index')

    uuid = params.delete('uuid')
    inode.delete(uuid)
  end
end
