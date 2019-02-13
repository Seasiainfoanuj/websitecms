class Admin::BaseController < ApplicationController
  layout 'admin'

  before_action :authenticate_user!
  # before_filter :verify_admin

  private
    def verify_admin
      redirect_to root_url if !current_user || !current_user.admin?
    end
end
