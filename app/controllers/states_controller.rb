# frozen_string_literal: true

class StatesController < ApplicationController
  ##--
  # Purpose: Get the list of states
  ##++
  def index
    states = CountryStateSelect.collect_states(params[:country_id])
    render json: { status: 200, states: states }
  end
end
