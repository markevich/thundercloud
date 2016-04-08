class TokensController < ApiController
  def create
    if permitted_params[:login] != 'user' || permitted_params[:password] != 'password'
      raise ActiveRecord::RecordNotFound.new('Wrong login or password')
    end
  end

  def permitted_params
    params.permit(:login, :password)
  end
end
