AdaptorTemplate.controllers :machines, :map => "/inodes/:inode_uuid" do
  before do
    @inode = INode.find_by_uuid(params[:inode_uuid])
  end

  # Creates
  post :create do
    @machine = Machine.new(params)
    @machine.save(@inode)

    render 'machines/show'
  end

  # Reads
  get :index do
    @machines = Machine.all(@inode)

    render 'machines/index'
  end

  get :index, :map => 'machines/readings' do
    @machines = Machine.all(@inode)

    render 'machines/readings'
  end

  get :index, :map => 'machines/:uuid/readings' do
    @machine = Machine.find_by_uuid(@inode, params[:uuid])

    render 'machines/readings'
  end

  get :show, :map => "machines/:uuid" do
    @machine = Machine.find_by_uuid(@inode, params[:uuid])

    render 'machines/show'
  end

  # Updates
  put :show, :map => 'machines/:uuid/start' do
    @machine = Machine.find_by_uuid(@inode, params[:uuid]).start(@inode)

    render 'machines/show'
  end

  put :show, :map => 'machines/:uuid/stop' do
    @machine = Machine.find_by_uuid(@inode, params[:uuid]).stop(@inode)

    render 'machines/show'
  end

  put :show, :map => 'machines/:uuid/restart' do
    @machine = Machine.find_by_uuid(@inode, params[:uuid]).restart(@inode)

    render 'machines/show'
  end

  put :show, :map => 'machines/:uuid/force_stop' do
    @machine = Machine.find_by_uuid(@inode, params[:uuid]).force_stop(@inode)
  
    render 'machines/show'
  end
 
  put :show, :map => 'machines/:uuid/force_restart' do
    @machine = Machine.find_by_uuid(@inode, params[:uuid]).force_restart(@inode)

    render 'machines/show'
  end

  # Deletes
  delete :delete, :map => "machines/:uuid" do
    @machine = Machine.find_by_uuid(@inode, params[:uuid])
    @machine.delete(@inode)

    render 'machines/show'
  end
end
