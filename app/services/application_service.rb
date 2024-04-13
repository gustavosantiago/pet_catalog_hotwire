# frozen_string_literal: true

class ApplicationService
  prepend SimpleCommand
  include ActiveModel::Validations

  def initialize(**args); end
end