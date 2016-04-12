module ManageOne
  module Request
    module Token
      # NOTE: it's not a token, but a User or mix token with Users
      # TODO: add Admin and Tenant* namespaces
      class Create < ManageOne::Request::Base
        def initialize(username, password)
          @username = username
          @password = password
        end

        def params
          { 'userName' => @username, 'password' => @password }
        end

        # returns:
        # tokenID, userId, userBirthVdcId, passwordOverPeriod, unlockPeriod, loginUserStatus
        def send
          post('/tokens')
        end
      end
    end
  end
end
