# frozen_string_literal: true

module Pets
  class List < ApplicationService
    def call
      Pet.all.order(created_at: :desc)
    end
  end
end
