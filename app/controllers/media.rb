AdaptorTemplate.controllers :media, :parent => :inodes do
  before do
    logger.info('media#before')
    content_type 'application/json'
    @inode = INode.find_by_uuid(params[:inode_id])
  end

  get :index do
    logger.info('GET - media#index')
    @medium = Medium.find_by_descriptor_location(@inode, params[:medium_descriptor_location])

    render 'media/show'
  end

  delete :index do
    logger.info('DELETE - media#delete')
    @medium = Medium.delete(@inode, params[:medium_location])

    render 'media/delete'
  end
end
