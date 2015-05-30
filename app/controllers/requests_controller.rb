class RequestsController < ApplicationController

  def get
    remote_response = HTTParty.get(params[:url])

    response.headers['Access-Control-Allow-Origin'] = '*'
    response.headers['Content-Type'] = remote_response.content_type

    render text: remote_response.body
  rescue => error
    render text: error.message
  end

end
