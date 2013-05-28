AdaptorTemplate.controllers :machines, :parent => :inodes do
  before do
    logger.info('machines#before')
    content_type 'application/json'
    @inode = INode.find_by_uuid(params[:inode_id])
  end

  # Creates
  post :index do
    logger.info('POST - machines#index')
    @machine = Machine.new(params)
    @machine.save(@inode)

    render 'machines/show'
  end

  # Reads
  get :index do
    logger.info('GET - machines#index')
    @machines = Machine.all(@inode)

    render 'machines/index'
  end

  get :index, :map => 'machines/readings' do
    logger.info('GET - machines#readings')
    @machines = Machine.all_with_readings(@inode, params[:interval], params[:since], params[:until])

    render 'machines/readings'
  end

  get :index, :map => 'machines/:uuid/readings' do
    logger.info('GET - machines.uuid#readings')
    @machine = Machine.find_by_uuid(@inode, params[:uuid]).get_readings(params[:interval], params[:since], params[:until])

    render 'machines/readings'
  end

  get :show, :map => "machines/:uuid" do
    logger.info('GET - machines.uuid#show')
    @machine = Machine.find_by_uuid(@inode, params[:uuid])

    render 'machines/show'
  end

  # Updates
  put :show, :map => 'machines/:uuid/start' do
    logger.info('GET - machines.uuid#start')
    @machine = Machine.start(@inode, params[:uuid])

    render 'machines/show'
  end

  put :show, :map => 'machines/:uuid/stop' do
    logger.info('GET - machines.uuid#stop')
    @machine = Machine.stop(@inode, params[:uuid])

    render 'machines/show'
  end

  put :show, :map => 'machines/:uuid/restart' do
    logger.info('GET - machines.uuid#restart')
    @machine = Machine.restart(@inode, params[:uuid])

    render 'machines/show'
  end

  put :show, :map => 'machines/:uuid/force_stop' do
    logger.info('GET - machines.uuid#force_stop')
    @machine = Machine.force_stop(@inode, params[:uuid])

    render 'machines/show'
  end

  put :show, :map => 'machines/:uuid/force_restart' do
    logger.info('GET - machines.uuid#force_restart')
    @machine = Machine.force_restart(@inode, params[:uuid])

    render 'machines/show'
  end

  # Deletes
  delete :delete, :map => "machines/:uuid" do
    logger.info('DELETE - machines.uuid#delete')
    @machine = Machine.delete(@inode, params[:uuid])

    status 204
    render 'machines/delete'
  end
end
