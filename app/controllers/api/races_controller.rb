module Api
  class RacesController < ApplicationController
    before_action :set_race, only: [:show, :edit, :update, :destroy]

    rescue_from Mongoid::Errors::DocumentNotFound do |exception|
      respond_to do |format|
        format.json {
          render status: :not_found,
          template: 'api/error_msg',
          locals: {error: {msg: "woops: cannot find race[#{params[:id]}]"}}
        }
        format.xml {
          render status: :not_found,
          template: 'api/error_msg',
          locals: {msg: "whoops: cannot find race[#{params[:id]}]"}
        }
      end
    end

    rescue_from ActionController::UnknownFormat do |exception|
      render status: :unsupported_media_type,
        plain: "whoops: we do not support that content-type[#{request.format}]"
    end

    def index
      if !request.accept || request.accept == '*/*'
        render plain: "/api/races, offset=[#{params[:offset]}], limit=[#{params[:limit]}]"
      else
      end
    end

    def show
      if request.accept && request.accept != '*/*'
        respond_to do |format|
          format.json {
            render status: :ok,
            template: 'api/race',
            locals: {race: @race}
          }
          format.xml {
            render status: :ok,
            template: 'api/race',
            locals: {race: @race}
          }
        end
      else
      end
    end

    def results
      @results = Race.find(params[:race_id]).entrants
    end

    def result
      @result = Race.find(params[:race_id]).entrants.where(id: params[:id]).first
      render status: :ok,
        locals: {result: @result}
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

    def update
      Rails.logger.debug("method=#{request.method}")
      if @race.update(race_params)
        render json: @race, status: :ok
      else
      end
    end

    def destroy
      @race.destroy
      render nothing: true, status: :no_content
    end

    private

    def race_params
      params.require(:race).permit(:name, :date)
    end

    def set_race
      @race = Race.find(params[:id])
    end
  end
end
