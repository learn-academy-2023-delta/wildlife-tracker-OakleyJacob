class SightingsController < ApplicationController
    def index
        sightings = Sighting.where(date: params[:start_date]..params[:end_date])
        render json: sightings
    end
    def show
        sighting = Sighting.find(params[:id])
        render json: sighting, include: [:animal=> {:only=> [:common_name, :scientific_binomial]}]
    end
    def create
        sighting = Sighting.create(sighting_params)
        if sighting.valid?
            render json: sighting

        else 
            render json: sighting.errors
        end

    end

    def update
        sighting = Sighting.find(params[:id])
        if sighting.update(sighting_params)
            render json: sighting
        else
            render json: sighting.errors
        end
    end
    def destroy
        sighting = Sighting.find(params[:id])
        if sighting.destroy
            render json: sighting
        else
            render json: sighting.errors
        end
    end

      private
      def sighting_params
        params.require(:sighting).permit(:latitude, :longitude, :date, :animal_id, :start_date, :end_date)
      end
end
