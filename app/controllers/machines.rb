Adaptor.controllers :machines do
  # Reads
  get :index do
    @machines = Fusion::Machine.all()

    render 'machines/index'
  end

  get :index, :map => 'machines/readings' do
    @machines = Fusion::Machine.all()

    render 'machines/readings'
  end

  get :index, :map => 'machines/:uuid/readings' do
    @machine = Fusion::Machine.find_by_uuid(params[:uuid])

    render 'machines/readings'
  end

  get :show, :map => "machines/:uuid" do
    @machine = Fusion::Machine.find_by_uuid(params[:uuid])

    render 'machines/show'
  end

  # Updates
  put :show, :map => 'machines/:uuid/power_on' do
    @machine = Fusion::Machine.find_by_uuid(params[:uuid])
    @machine.power_on if @machine.present?

    render 'machines/show'
  end

  put :show, :map => 'machines/:uuid/power_off' do
    @machine = Fusion::Machine.find_by_uuid(params[:uuid])
    @machine.power_off if @machine.present?

    render 'machines/show'
  end

  put :show, :map => 'machines/:uuid/restart' do
    @machine = Fusion::Machine.find_by_uuid(params[:uuid])
    @machine.restart if @machine.present?

    render 'machines/show'
  end

  put :show, :map => 'machines/:uuid/shutdown' do
    @machine = Fusion::Machine.find_by_uuid(params[:uuid])
    @machine.shutdown if @machine.present?

    render 'machines/show'
  end

  put :show, :map => 'machines/:uuid/unplug' do
    @machine = Fusion::Machine.find_by_uuid(params[:uuid])
    @machine.unplug if @machine.present?

    render 'machines/show'
  end
  
  # Creates
  post :create do
    @machine = Fusion::Machine.new(params)
    @machine.save

    render 'machines/show'
  end

  # Deletes
  delete :delete, :map => "machines/:uuid" do
    @machine = Fusion::Machine.find_by_uuid(params[:uuid])
    @machine.delete

    render 'machines/show'
  end
end
