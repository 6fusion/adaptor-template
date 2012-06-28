AdaptorTemplate.controllers :hosts, :parent => :i_nodes do
  before do
    @i_node = INode.find_by_uuid(params[:i_node_id])
  end

  get :index do
    @hosts = i_node.hosts.all(@i_node)

    render 'hosts/index'
  end

  get :index, :map => 'hosts/readings' do
    @hosts = i_node.hosts.all(@i_node)

    render 'hosts/readings'
  end

  get :index, :map => 'hosts/:uuid/readings' do
    @host = i_node.hosts.find_by_uuid(@i_node, params[:uuid])

    render 'hosts/readings'
  end

  get :show, :map => "hosts/:uuid" do
    @host = i_node.hosts.find_by_uuid(@i_node, params[:uuid])

    render 'hosts/show'
  end
end