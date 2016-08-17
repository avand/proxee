class YelpController < ApplicationController

  def search
    results = if [:sw_latitude, :sw_longitude, :ne_latitude, :ne_longitude].all? { |k| params[k].present? }
      Yelp.client.search_by_coordinates({
        sw_latitude: params.delete(:sw_latitude),
        sw_longitude: params.delete(:sw_longitude),
        ne_latitude: params.delete(:ne_latitude),
        ne_longitude: params.delete(:ne_longitude)
      }, params)
    elsif [:latitude, :longitude].all? { |k| params[k].present? }
      Yelp.client.search_by_coordinates({
        latitude: params.delete(:latitude),
        longitude: params.delete(:longitude)
      }, params)
    elsif params[:location].present?
      Yelp.client.search(params.delete(:location), params)
    else
      { error: "Please supply a location." }
    end

    render json: results
  end

end
