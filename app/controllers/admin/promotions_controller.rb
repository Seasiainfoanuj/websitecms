class Admin::PromotionsController < Admin::BaseController
  before_action :set_promotion, only: [:edit, :update, :destroy]

  def index
    @promotions = Promotion.all.paginate(page: params[:page], per_page: params[:per_page] || 10)
  end

  def edit
  end

  def update
    if params[:publish]
      @promotion.status = "published"
      @promotion.published_on = Time.zone.now
    end
    @promotion.changed_by = current_user
    respond_to do |format|
      if @promotion.update(promotion_params)
        format.html { redirect_to admin_promotions_url, notice: 'Promotion Page was successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end

  private
    def set_promotion
      @promotion = Promotion.find_by(id: params[:id])
    end

    def promotion_params
      params.require(:promotion).permit(
        :title,
        :status,
        :visibility,
        :feature_description,
        :feature_video_url,
        :testimonials
      )
    end
end
