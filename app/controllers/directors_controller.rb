class DirectorsController < ApplicationController
  rescue_from ActiveRecord::RecordNotFound, with: :render_not_found_response

  class DirectorsController < ApplicationController

    def index
      directors = Director.all
      render json: directors, include: ['movies', 'movies.reviews']
    end
  
    def show
      director = Director.find(params[:id])
      render json: director, include: ['movies', 'movies.reviews']
    end
  
  end

  private

  def render_not_found_response
    render json: { error: "Director not found" }, status: :not_found
  end

end
