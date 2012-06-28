AdaptorTemplate.controllers :capabilities, :parent => :i_nodes do
  before do
    @i_node = INode.find_by_uuid(params[:i_node_id])
  end

  get :index do
    @capabilities = Capability.all(@i_node)

    render 'capabilities/index'
  end
end