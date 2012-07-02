AdaptorTemplate.controllers :capabilities, :parent => :i_nodes do
  before do
    logger.info('capabilities#before')
    @i_node = INode.find_by_uuid(params[:i_node_id])
  end

  get :index do
    logger.info('capabilities#index')
    @capabilities = Capability.all(@i_node)

    render 'capabilities/index'
  end
end