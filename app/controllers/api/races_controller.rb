module Api
  class RacesController < ApplicationController
    def index
      if !request.accept || request.accept == '*/*'
        render plain: "/api/races, offset=[#{params[:offset]}], limit=[#{params[:limit]}]"
      else
      end
    end

    def show
      if !request.accept || request.accept == '*/*'
        render plain: "/api/races/#{params[:id]}"
      else
      end
    end

    def results
      if !request.accept || request.accept == '*/*'
        render plain: "/api/races/#{params[:id]}/results"
      else
      end
    end

    def result
      if !request.accept || request.accept == '*/*'
        render plain: "/api/races/#{params[:race_id]}/results/#{params[:id]}"
      else
      end
    end

    def create
      if request.accept && request.accept != '*/*'
        @race = Race.new(race_params)
        if @race.save
          render plain: @race.name, status: :created
        else
          render json: @race.errors, status: :unprocessable_entity
        end
      else
      end
    end

    private

    def race_params
      params.require(:race).permit(:name, :date)
    end
  end
end
