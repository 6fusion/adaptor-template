AdaptorTemplate.controllers :machines, :map => "/inodes/:inode_uuid" do
  before do
    logger.info('machines#before')
    content_type 'application/json'
    @inode = INode.find_by_uuid(params[:inode_uuid])
  end

  # Creates one or more machines from an OVF (called for 'add' capability)
  # This action may take a long time to complete and will be called with a
  # long timeout to give sufficient time for machine provisioning to complete
  # The OVF will be modified to reflect the state of the inode (i.e, networks will already be mapped)
  # @param ovf [String] raw xml from OVF
  # @param options [Hash] extra options
  post :index do
    logger.info('POST - machines#index')
    @machines = Machine.from_ovf(params['ovf']).map do |vm|
      vm.create(@inode, params['options'])
    end
    render 'machines/index'
  end

  # Reads
  get :index do
    logger.info('GET - machines#index')
    @machines = Machine.all(@inode)

    render 'machines/index'
  end

  get :index, :map => 'machines/readings' do
    logger.info('GET - machines#readings')
    @machines = Machine.all(@inode)

    render 'machines/readings'
  end

  get :index, :map => 'machines/:uuid/readings' do
    logger.info('GET - machines.uuid#readings')
    @machine = Machine.find_by_uuid(@inode, params[:uuid])

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
    @machine = Machine.find_by_uuid(@inode, params[:uuid]).start(@inode)

    render 'machines/show'
  end

  put :show, :map => 'machines/:uuid/stop' do
    logger.info('GET - machines.uuid#stop')
    @machine = Machine.find_by_uuid(@inode, params[:uuid]).stop(@inode)

    render 'machines/show'
  end

  put :show, :map => 'machines/:uuid/restart' do
    logger.info('GET - machines.uuid#restart')
    @machine = Machine.find_by_uuid(@inode, params[:uuid]).restart(@inode)

    render 'machines/show'
  end

  put :show, :map => 'machines/:uuid/force_stop' do
    logger.info('GET - machines.uuid#force_stop')
    @machine = Machine.find_by_uuid(@inode, params[:uuid]).force_stop(@inode)

    render 'machines/show'
  end

  put :show, :map => 'machines/:uuid/force_restart' do
    logger.info('GET - machines.uuid#force_restart')
    @machine = Machine.find_by_uuid(@inode, params[:uuid]).force_restart(@inode)

    render 'machines/show'
  end

  # Deletes
  delete :delete, :map => "machines/:uuid" do
    logger.info('DELETE - machines.uuid#delete')
    @machine = Machine.find_by_uuid(@inode, params[:uuid])
    @machine.delete(@inode)

    status 204
    render 'machines/delete'
  end
end
