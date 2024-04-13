# frozen_string_literal: true

class Pet < ApplicationRecord
  validates :name, :breed, :url, :description, presence: true
end
