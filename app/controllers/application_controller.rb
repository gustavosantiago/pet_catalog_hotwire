# frozen_string_literal: true

class ApplicationController < ActionController::Base
  def render_errors(turbo_stream, errors)
    turbo_stream.replace('form-errors', partial: 'layouts/shared/errors', locals: { errors: errors })
  end

  def render_success(turbo_stream, object, action)
    turbo_stream.replace('form-success', partial: 'layouts/shared/success', locals: { object: object, action: action })
  end
end
