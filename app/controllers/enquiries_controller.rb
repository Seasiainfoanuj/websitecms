class EnquiriesController < ApplicationController
  include EnquirySubmission

  def enquiry_types
    begin
      uri = URI( "#{ENV["SERVICE_MANAGER_URL"]}/api/enquiry_types")

      http = Net::HTTP.new(uri.host, uri.port)
      http.use_ssl = true

      request = Net::HTTP::Get.new(uri.request_uri)

      request.basic_auth("username", "password")
      response = http.request(request)

      @enquiry_types = JSON(response.body)

      respond_to do |format|
        format.json { render json: response.body }
        format.js
      end
    rescue
      respond_to do |format|
        format.json { render json: {"error" => "Connection Error"} }
        format.js
      end
    end
  end
end
