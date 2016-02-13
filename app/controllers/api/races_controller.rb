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
      if !request.accept || request.accept == '*/*'
        render plain: "#{params[:race][:name]}", status: :ok
      else
      end
    end
  end
end
