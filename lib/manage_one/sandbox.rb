module ManageOne
  class Sandbox
    def self.play
      name = "cloud_admin"
      token = ManageOne::Request::Token::Create.new(name, "FusionSphere123")

      params = token.send.merge(name: name)
      raise "unsuccessfull login" unless params['loginUserStatus'] == ManageOne::User::SUCCESS

      user = ManageOne::User.new(params) # from token
      # user_query = ManageOne::Request::User::Query.new(user.user_birth_vdc_id, user.user_guid, user.token_id).send

      vdcs = ManageOne::Request::VDC::List.new(user.user_guid, user.token_id).send
      # vdcs = ManageOne::Request::VDC::Modify.new(user.user_birth_vdc_id, user.user_guid, user.token_id).send
      binding.pry
    end

  end
end
