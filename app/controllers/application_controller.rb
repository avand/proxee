class ApplicationController < ActionController::Base

  before_filter :allow_cross_origin_requests

protected

  def allow_cross_origin_requests
    response.headers['Access-Control-Allow-Origin'] = '*'
  end

end
