class ApiController < ActionController::API
  include ActionView::Layouts
  include ActionController::ImplicitRender

  rescue_from ActiveRecord::RecordNotFound, with: :record_not_found

  private
  def record_not_found(error)
    render body: { error: error.message }.to_json, status: :not_found
  end
end
