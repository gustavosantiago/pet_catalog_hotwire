# frozen_string_literal: true

# Endpoints for pets
class PetsController < ApplicationController
  before_action :set_pet, except: %i[index new create]

  def index
    @pets = Pets::List.call
  end

  def new
    @pet = Pet.new
  end

  def edit
  end

  def create
    create_service = Pets::Create.call(params: pet_params)

    @pet = create_service.result

    respond_to do |format|
      if create_service.success?
        format.html { redirect_to pets_path }
        format.turbo_stream do
          render turbo_stream: render_success(turbo_stream, 'Pet', 'created')
        end
      else
        format.html { render :new, status: :unprocessable_entity }
        format.turbo_stream do
          render turbo_stream: render_errors(turbo_stream, create_service.errors)
        end
      end
    end
  end

  def update
    update_service = Pets::Update.call(pet: @pet, params: pet_params)

    respond_to do |format|
      if update_service.success?
        format.html { redirect_to pets_path }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.turbo_stream do
          render turbo_stream: render_errors(turbo_stream, update_service.errors)
        end
      end
    end
  end

  def destroy
    @pet.delete

    respond_to do |format|
      format.turbo_stream { render turbo_stream: turbo_stream.remove("pet_#{@pet.id}") }
    end
  end

  private

  def set_pet
    @pet = Pet.find(params[:id])
  end

  def pet_params
    params.require(:pet).permit(:name, :breed, :url, :description)
  end
end
