module EnquirySubmission

  def send_enquiry
    begin
      if Rails.env.development? || Rails.env.test?
        uri = URI('http://0.0.0.0:3000/api/enquiries')
        http = Net::HTTP.new(uri.host, uri.port)
        http.use_ssl = false
      else
        uri = URI('https://secure.bus4x4.com.au/api/enquiries')
        http = Net::HTTP.new(uri.host, uri.port)
        http.use_ssl = true
      end  

      request = Net::HTTP::Post.new(uri.path, {'Content-Type' =>'application/json'})
      request.body = params.to_json
      response = http.request(request)
      render_response(response)
    rescue
      puts "Connection Error - Can't connect to #{uri}"
      render json: {'type' => 'connection_error'}
    end
  end

  def render_response(response)
    res_json = JSON(response.body)

    if response.code == '201'
      type = 'success'
      data = res_json
    else
      type = 'error'
      data = {}
      res_json.each do |key, value|
        data["#{key.humanize}"] = value
      end
    end

    render json: {'type' => type, 'data' => data}
  end
end
