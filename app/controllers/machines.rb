AdaptorTemplate.controllers :machines, :map => "/inodes/:inode_uuid" do
  before do
    @i_node = INode.find_by_uuid(params[:inode_uuid])
  end

  # Creates
  post :create do
    @machine = Machine.new(params)
    @machine.save(@i_node)

    render 'machines/show'
  end

  # Reads
  get :index do
    @machines = Machine.all(@i_node)

    render 'machines/index'
  end

  get :index, :map => 'machines/readings' do
    @machines = Machine.all(@i_node)

    render 'machines/readings'
  end

  get :index, :map => 'machines/:uuid/readings' do
    @machine = Machine.find_by_uuid(@i_node, params[:uuid])

    render 'machines/readings'
  end

  get :show, :map => "machines/:uuid" do
    @machine = Machine.find_by_uuid(@i_node, params[:uuid])

    render 'machines/show'
  end

  # Updates
  put :show, :map => 'machines/:uuid/power_on' do
    @machine = Machine.find_by_uuid(@i_node, params[:uuid])
    @machine.power_on(@i_node) if @machine.present?

    render 'machines/show'
  end

  put :show, :map => 'machines/:uuid/power_off' do
    @machine = Machine.find_by_uuid(@i_node, params[:uuid])
    @machine.power_off(@i_node) if @machine.present?

    render 'machines/show'
  end

  put :show, :map => 'machines/:uuid/restart' do
    @machine = Machine.find_by_uuid(@i_node, params[:uuid])
    @machine.restart(@i_node) if @machine.present?

    render 'machines/show'
  end

  put :show, :map => 'machines/:uuid/shutdown' do
    @machine = Machine.find_by_uuid(@i_node, params[:uuid])
    @machine.shutdown(@i_node) if @machine.present?

    render 'machines/show'
  end

  put :show, :map => 'machines/:uuid/unplug' do
    @machine = Machine.find_by_uuid(@i_node, params[:uuid])
    @machine.unplug(@i_node) if @machine.present?

    render 'machines/show'
  end

  # Deletes
  delete :delete, :map => "machines/:uuid" do
    @machine = Machine.find_by_uuid(@i_node, params[:uuid])
    @machine.delete(@i_node)

    render 'machines/show'
  end
end
