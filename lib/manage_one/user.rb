module ManageOne
  class User
    SUCCESS = 'SUCCESS'

    attr_accessor :name, :user_guid, :user_birth_vdc_id, :password_over_period,
      :unlock_period, :token_id

    def initialize(params = {})
      @name = params[:name]
      @user_guid = params["userId"]
      @user_birth_vdc_id = params["userBirthVdcId"]
      @password_over_period = params["passwordOverPeriod"]
      @unlock_period = params["unlockPeriod"]
      @token_id = params["tokenId"]
    end

  end
end
