class Api::V1::PropertiesController < ApplicationController
  before_action :set_property, only: %i[ show update destroy ]
  before_action :authenticate_user!, only: %i[ create update destroy ]

  # GET /properties
  def index
    if filter_params && filter_params[:owned]
      if current_user
        @properties = Property.where(user: current_user)
      else
        return render json: { message: 'Only logged in users can see their properties' }, status: :unauthorized
      end
    else
      @properties = Property.all
    end

    render json: @properties.map{|property| property.attributes.merge(images: property.images.map { |image| url_for(image) })}
  end

  # GET /properties/1
  #def show
    #render json: @property.attributes.merge(owner_email: @property.user.email, images: @property.#images.map { |image| url_for(image) })
  #end

  def show
    images_data = @property.images.map { |image| { id: image.id, url: url_for(image) } }
    render json: @property.attributes.merge(owner_email: @property.user.email, images: images_data)
  end


  # POST /properties
  def create
    @property = Property.new(property_params.except(:images))
    @property.user = current_user
    images = params[:property][:images]

    if images
      images.each do |image|
        @property.images.attach(image)
      end
    end

    if @property.save
      render json: @property, status: :created
    else
      render json: @property.errors, status: :unprocessable_entity
    end
  end

# PATCH/PUT /properties/1
def update
  if current_user == @property.user
    images_to_delete = params[:deleted_images] if params[:deleted_images].present?
    images = params[:property][:images] if params[:property].present?

    # Supprimer les images sélectionnées
    if images_to_delete
      images_to_delete = JSON.parse(images_to_delete)
      images_to_delete.each do |image_id|
        image = @property.images.find(image_id)
        image.purge
      end
    end

    # Attacher de nouvelles images, si nécessaire
    if images
      images.each do |image|
        @property.images.attach(image)
      end
    end

    if @property.update(property_params.except(:images))
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

      params.require(:property).permit(:title, :price, :description, :location, :furnished, :surface, :room, :floor, :terrace, :garden, :caretaker, :lift, :user_id, images: [])

    end

    def filter_params
      params.permit(:owned)
    end
end
