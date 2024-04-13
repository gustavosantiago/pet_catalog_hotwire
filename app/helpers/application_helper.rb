# frozen_string_literal: true

# General Helpers
module ApplicationHelper
  def page_header(title:)
    content_tag(:div, class: 'header mt-2') do
      content_tag(:h1, title)
    end
  end

  def errors_for(object, field)
    content_tag(:div, object.errors[field].join(', '), class: 'text-danger') if object.errors[field].present?
  end
end
