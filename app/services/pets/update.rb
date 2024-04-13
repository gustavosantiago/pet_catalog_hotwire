# frozen_string_literal: true

module Pets
  class Update
    prepend SimpleCommand

    def initialize(pet:, params:)
      @pet = pet
      @params = params
    end

    def call
      if @pet.update(@params)
        @pet
      else
        errors.merge!(@pet.errors)
        nil
      end
    end
  end
end
