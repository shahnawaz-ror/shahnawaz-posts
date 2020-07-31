# frozen_string_literal: true

class CitiesController < ApplicationController
  ##--
  # Purpose: Fetch all cities list
  ##++
  def index
    cities = CountryStateSelect.collect_cities(params[:state_id].to_s, params[:country_id].to_s)
    render json: { status: 200, cities: cities }
  end
end
