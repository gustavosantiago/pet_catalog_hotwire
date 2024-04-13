# frozen_string_literal: true

module Pets
  # Service to create pet
  class Create
    prepend SimpleCommand

    def initialize(params:)
      @params = params
    end

    def call
      pet = Pet.new(@params)

      if pet.save
        pet
      else
        errors.merge!(pet.errors)
        nil
      end
    end
  end
end
