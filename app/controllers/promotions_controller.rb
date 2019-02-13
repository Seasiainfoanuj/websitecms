class PromotionsController < ApplicationController
  include EnquirySubmission

  before_action :is_promotion_page?

  def show
    @promotion = Promotion.find_by(page_name: params[:id])
    if @promotion.nil? || @promotion.visibility == 'private' || @promotion.status == 'draft'
      redirect_to root_url
    end
  end

  private

    def is_promotion_page?
      true
    end
end