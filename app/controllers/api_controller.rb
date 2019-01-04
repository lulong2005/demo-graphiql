class ApiController < ApplicationController
  skip_before_action :verify_authenticity_token

  protected

  def resolved_params
    params.merge!(current_member: current_member)
  end

  private

  def authenticate_request!
    return if current_member
    render json: {
      error: 'Not Authorized'
    }, status: :unauthorized
  end

  def current_member
    @current_member ||=
      if params[:user_authentication_token]
        AuthorizeApiRequest.call(
          'Authorization' => "Base #{params[:user_authentication_token]}"
        ).result
      elsif (auth_token = cookies['user-authentication-token'])
        AuthorizeApiRequest
          .call('Authorization' => "Base #{auth_token}").result
      else
        AuthorizeApiRequest.call(request.headers).result
      end
  end
end
