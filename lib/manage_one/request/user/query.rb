module ManageOne
  module Request
    module User
      class Query < ManageOne::Request::Base
        def initialize(vdc_id, user_guid, token)
          @vdc_id = vdc_id
          @user_guid = user_guid
          @token = token
        end

        def send
          get("#{@vdc_id}/users/#{@user_guid}")
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
