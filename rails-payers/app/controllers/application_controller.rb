class ApplicationController < ActionController::API
    rescue_from "ActiveRecord::RecordNotFound", with: :render_error
    rescue_from "ActiveRecord::RecordInvalid", with: :render_error

    private
    def render_error(err)
        self.action_name == "create" ? status = 422 : status = 404
        render json: {error: err}, status: status
    end

end
