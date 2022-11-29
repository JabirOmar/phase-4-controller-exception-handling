class BirdsController < ApplicationController

rescue_from ActiveRecord::RecordNotFound, with: :respond_not_found

  # GET /birds
  def index
    birds = Bird.all
    render json: birds
  end

  # POST /birds
  def create
    bird = Bird.create(bird_params)
    render json: bird, status: :created
  end

  # GET /birds/:id
  def show
    bird = find_items_id
    render json: bird
  end

  # PATCH /birds/:id
  def update
    bird = find_items_id
    bird.update(bird_params)
    render json: bird
  end

  # PATCH /birds/:id/like
  def increment_likes
    bird = find_items_id
    bird.update(likes: bird.likes + 1)
    render json: bird
  end

  # DELETE /birds/:id
  def destroy
    bird = find_items_id
    bird.destroy
    head :no_content
  end

  
  # PRIVATE Section ......... 
  private

  def bird_params
    params.permit(:name, :species, :likes)
  end

  def find_items_id
    Bird.find(params[:id])
  end

  def respond_not_found
    render json: { error: "Bird not found" }, status: 404
  end

end
