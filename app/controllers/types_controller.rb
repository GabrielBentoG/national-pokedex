class TypesController < ApplicationController
  include ErrorSerializer

  before_action :set_type, only: [:show, :update, :destroy]

  #GET /types
  def index
    @types = Type.all

    render json: TypeSerializer.new(@types).serialized_json

  end

  #GET /types/:id
  def show
    render json: TypeSerializer.new(@type).serialized_json
  end

  #POST /types
  def create
    @type = Type.new(type_params)

    if @type.save
      render json: TypeSerializer.new(@type).serialized_json, status: :created
    else
      render json: ErrorSerializer.serialize(@type.errors), status: :unprocessable_entity
    end
  end

  def update
    def update
      if @type.update(type_params)
        render json: TypeSerializer.new(@type).serialized_json
      else
        render json: ErrorSerializer.serialize(@type.errors), status: :unprocessable_entity
      end
    end
  end

  def delete
    @type.destroy
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_type
    @type = Type.find(params[:id])
  end

  # Only allow a trusted parameter "white list" through.
  def type_params
    ActiveModelSerializers::Deserialization.jsonapi_parse(params)
  end
end
