AdaptorTemplate.controllers :media_stores do
  before do
    logger.info('media_stores#before')
    content_type 'application/json'
  end

  post :index do
    logger.info('POST - media_stores#index')
    @media_store = MediaStore.mount(params[:data_center_id], params[:local_path], params[:remote_path], params[:engine_room])

    render 'media_stores/show'
  end

  delete :index do
    logger.info('DELETE - media_stores#index')
    @media_store = MediaStore.unmount(params[:data_center_id], params[:local_path])

    render 'media_stores/show'
  end
end
