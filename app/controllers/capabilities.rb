AdaptorTemplate.controllers :capabilities, :map => "/inodes/:inode_uuid" do
  before do
    logger.info('capabilities#before')
    @i_node = INode.find_by_uuid(params[:inode_uuid])
  end

  get :index do
    logger.info('capabilities#index')
    @capabilities = Capability.all(@i_node)

    render 'capabilities/index'
  end
end