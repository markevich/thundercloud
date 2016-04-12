module ManageOne
  module Request
    module VDC
      class Query < ManageOne::Request::Base
        def initialize(user_guid)
          @user_guid = user_guid
        end

        def send
          post('/vdc/list')
        end

        def headers
          { 'X-Auth-User-ID' => @user_guid }
        end
      end
    end
  end
end
