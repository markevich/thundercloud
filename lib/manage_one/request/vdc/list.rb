module ManageOne
  module Request
    module VDC
      class List < ManageOne::Request::Base
        def initialize(user_guid, token)
          @user_guid = user_guid
          @token = token
        end

        def send
          get("/users/#{@user_guid}/vdcs")
        end

        def headers
          {
            'X-Auth-User-ID' => @user_guid,
            'X-HW-Cloud-Auth-Token' => @token
           }
        end
      end
    end
  end
end
