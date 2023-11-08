# frozen_string_literal: true

class ApiController < ActionController::API
  before_action :transform_params

  private

  def transform_params
    params.deep_transform_keys!(&:underscore)
  end
end
