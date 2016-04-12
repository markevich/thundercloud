module ManageOne
  module Request
    module VDC
      class Modify < ManageOne::Request::Base
        def initialize(vdc_id, user_guid, token)
          @vdc_id = vdc_id
          @user_guid = user_guid
          @token = token
        end

        def send
          put("/users/#{@user_guid}/vdcs/#{@vdc_id}")
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
