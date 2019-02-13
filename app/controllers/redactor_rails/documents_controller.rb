include ActionView::Helpers::NumberHelper

class RedactorRails::DocumentsController < ApplicationController
  before_filter :redactor_authenticate_user!

  def index
    documents = RedactorRails.document_model.all

    @documents = documents.map do |doc|
      {
        id: doc.id,
        user_id: doc.user_id,
        data_file_name: doc.data_file_name,
        data_content_type: doc.data_content_type,
        data_file_size: doc.data_file_size,
        assetable_id: doc.assetable_id,
        assetable_type: doc.assetable_type,
        width: doc.width,
        height: doc.height,
        created_at: doc.created_at,
        updated_at: doc.updated_at,
        image: doc.image,
        data: doc.data,
        title: doc.data_file_name,
        link: ActionController::Base.helpers.asset_url(doc.data),
        size: number_to_human_size(doc.data_file_size)
      }
    end

    render :json => @documents
  end

  def create
    @document = RedactorRails.document_model.new

    file = params[:file]
    @document.data = RedactorRails::Http.normalize_param(file, request)
    if @document.has_attribute?(:"#{RedactorRails.devise_user_key}")
      @document.send("#{RedactorRails.devise_user}=", redactor_current_user)
      @document.assetable = redactor_current_user
    end

    if @document.save
      render :text => { :filelink => @document.url, :filename => @document.filename }.to_json
    else
      render json: { error: @document.errors }
    end
  end

  def destroy
    @document = RedactorRails.document_model.find(params[:id])
    @document.destroy
    respond_to do |format|
      format.html { redirect_to request.referrer, notice: 'Document was permanently removed.' }
    end
  end

  private

  def redactor_authenticate_user!
    if RedactorRails.document_model.new.has_attribute?(RedactorRails.devise_user)
      super
    end
  end
end
