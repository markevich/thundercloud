module ManageOne
  module Request
    module Token
      class Create < ManageOne::Request::Base
        def initialize(username, password)
          @username = username
          @password = password
        end

        def params
          { 'userName' => @username, 'password' => @password }
        end

        def send
          post('/tokens')
        end
      end
    end
  end
end
