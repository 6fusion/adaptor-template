Adaptor.controllers :hosts do
  get :index do
    @hosts = Fusion::Host.all()

    render 'hosts/index'
  end

  get :index, :map => 'hosts/readings' do
    @hosts = Fusion::Host.all()

    render 'hosts/readings'
  end

  get :index, :map => 'hosts/:uuid/readings' do
    @host = Fusion::Host.find_by_uuid(params[:uuid])

    render 'hosts/readings'
  end

  get :show, :map => "hosts/:uuid" do
    @host = Fusion::Host.find_by_uuid(params[:uuid])

    render 'hosts/show'
  end
end
