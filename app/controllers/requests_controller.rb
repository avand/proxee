class RequestsController < ApplicationController

  def get
    remote_response = HTTParty.get(params[:url])

    response.headers['Access-Control-Allow-Origin'] = '*'

    render text: remote_response.body, content_type: response.content_type
  rescue => error
    render text: error.message
  end

end
