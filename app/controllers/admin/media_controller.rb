class Admin::MediaController < Admin::BaseController
  def pictures
    @pictures = RedactorRails.picture_model.all
  end

  def documents
    @documents = RedactorRails.document_model.all
  end

  def bulk_destroy_documents
    RedactorRails.document_model.where(:id => params[:ids]).destroy_all if params[:ids].present?
    redirect_to admin_media_documents_path, notice: 'Documents were successfully destroyed.'
  end

  def bulk_destroy_pictures
    RedactorRails.picture_model.where(:id => params[:ids]).destroy_all if params[:ids].present?
    redirect_to admin_media_pictures_path, notice: 'Pictures were successfully destroyed.'
  end
end
