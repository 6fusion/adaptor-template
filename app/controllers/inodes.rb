AdaptorTemplate.controllers :inodes, :priority => :low do
  before do
    logger.info('inodes#before')
    content_type 'application/json'
  end

  # Creates
  post :index do
    logger.info('POST - inodes#index')

    uuid = params['uuid']
    @inode = INode.new(params)
    @inode.save(uuid)
    render 'inodes/show'
  end

  # Reads
  get :index, :provides => [:json, :html] do
    logger.info('inodes#index')

    @inodes = INode.all()

    case content_type
    when :html then
      content_type 'text/html'
      render 'inodes/list'
    else
      render 'inodes/index'
    end
  end

  get :show, "/inodes/:uuid", :provides => [:json, :html] do
    logger.info('inodes#show')

    @inode = INode.find_by_uuid(params[:uuid])

    case content_type
    when :html then
      logger.info('DIAGNOSTICS - inodes#index')
      content_type 'text/html'
      render 'inodes/diagnostics'
    else
      content_type 'application/json'
      render 'inodes/show'
    end
  end

  # Updates
  put :index do
    logger.info('PUT - inodes#index')

    if params.present?
      uuid = params.delete('uuid')
      @inode = INode.find_by_uuid(uuid)
      @inode.update(uuid, params) if params.present?
    end
    render 'inodes/show'
  end

  # Deletes
  delete :index do
    logger.info('DELETE - inodes#index')

    uuid = params.delete('uuid')
    @inode = INode.find_by_uuid(uuid)
    @inode.delete(uuid)
    status 204
    render 'inodes/delete'
  end
end
