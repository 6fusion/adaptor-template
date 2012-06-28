AdaptorTemplate.controllers :capabilities do
  get :index do
    @capabilities = Capability.all

    render 'capabilities/index'
  end
end