AdaptorTemplate.controllers :hosts, :parent => :inodes do
  before do
    logger.info('hosts#before')
    content_type 'application/json'
    @inode = INode.find_by_uuid(params[:inode_id])
  end

  get :index do
    logger.info('GET - hosts#index')
    @hosts = Host.all(@inode)

    render 'hosts/index'
  end

  get :index, :map => 'hosts/readings' do
    logger.info('GET - hosts#readings')
    @hosts = Host.all(@inode)

    render 'hosts/readings'
  end

  get :index, :map => 'hosts/:uuid/readings' do
    logger.info('GET - hosts.uuid#readings')
    @host = Host.find_by_uuid(@inode, params[:uuid])

    render 'hosts/readings'
  end

  get :show, :map => "hosts/:uuid" do
    logger.info('GET - hosts#show')
    @host = Host.find_by_uuid(@inode, params[:uuid])

    render 'hosts/show'
  end
end