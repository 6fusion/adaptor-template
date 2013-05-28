AdaptorTemplate.controllers :capabilities, :parent => :inodes do
  before do
    logger.info('capabilities#before')
    content_type 'application/json'
    @inode = INode.find_by_uuid(params[:inode_id])
  end

   get :index do
    logger.info('GET - capabilities#index')
    @capabilities = Capability.all(@inode)

    render 'capabilities/index'
  end
end
