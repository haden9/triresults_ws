module Api
  class RacesController < ApplicationController
    def index
      if !request.accept || request.accept == '*/*'
        render plain: "/api/races"
      else
      end
    end

    def entry
      if !request.accept || request.accept == '*/*'
        render plain: "/api/racers/#{params[:racer_id]}/entries/#{params[:id]}"
      else
      end
    end

    def show
      if !request.accept || request.accept == '*/*'
      else
      end
    end
  end
end
