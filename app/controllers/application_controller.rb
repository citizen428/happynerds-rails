# frozen_string_literal: true

class ApplicationController < ActionController::Base
  private def expose(values)
    render locals: values
  end
end
