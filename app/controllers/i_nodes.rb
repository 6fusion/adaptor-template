AdaptorTemplate.controllers :i_nodes, :priority => :low do
  # Creates
  post :index do
    logger.info('i_nodes#index')
    i_node = INode.new(params)
    i_node.save
  end

  get :show, :map => "i_nodes/:uuid" do
    logger.info('i_nodes#show')
    @i_node = INode.find_by_uuid(params[:uuid])

    render 'i_nodes/show'
  end

  # Updates

  # Deletes
end