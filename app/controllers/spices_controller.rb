class SpicesController < ApplicationController

# rescue_from ActiveRecord::RecordNotFound, with: :not_found_response

  def index
    render json: Spice.all, status: :ok
  end

  # def show
  #   spice = find_spice
	# 	if spice
	# 		render json: spice, status: :ok
	# 	else
	# 		render json: not_found_response
	# 	end
	# end

	def create
		render json: Spice.create(spice_params), status: :created
	end

	def update
		spice = find_spice
		spice.update(spice_params)
		render json: spice, status: :accepted
	end

	def destroy
		spice = find_spice
		spice.destroy
		head :no_content
	end


	private

	def find_spice
		Spice.find_by(id: params[:id])
	end

	def spice_params
		params.permit(:title, :image, :description,:notes, :rating)
	end

	def not_found_response
		render json: { error: "Spice not found" }, status: :not_found
	end

end
