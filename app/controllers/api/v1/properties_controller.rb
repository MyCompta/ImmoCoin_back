class Api::V1::PropertiesController < ApplicationController
  before_action :set_property, only: %i[ show update destroy ]
  before_action :authenticate_user!, only: %i[ create update destroy ]

  # GET /properties
  def index
    # if filter_params && filter_params[:owned]
    #   if current_user
    #     @properties = Property.where(user: current_user)
    #   else
    #     return render json: { message: 'Only logged in users can see their properties' }, status: :unauthorized
    #   end
    # else
      @properties = Property.all
    # end

    render json: @properties
  end

  # GET /properties/1
  def show
    render json: @property.attributes.merge(owner_email: @property.user.email)
  end

  # POST /properties
  def create
    @property = Property.new(property_params)

    if @property.save
      render json: @property, status: :created
    else
      render json: @property.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /properties/1
  def update
    if current_user == @property.user
      if @property.update(property_params)
        render json: @property
      else
        render json: @property.errors, status: :unprocessable_entity
      end
    else
      render json: { message: 'Only the owner of the property can update it' }, status: :unauthorized
    end
  end

  # DELETE /properties/1
  def destroy
    if current_user == @property.user
      @property.destroy!
    else
      render json: { message: 'Only the owner of the property can delete it' }, status: :unauthorized
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_property
      @property = Property.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def property_params
      params.require(:property).permit(:title, :price, :description, :user_id, :location)
    end

    def filter_params
      params.permit(:owned)
    end
end
