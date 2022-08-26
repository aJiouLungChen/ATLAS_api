# frozen_string_literal: true

require 'google/apis/oauth2_v2'

class UserDataManager
  def initialize(access_token)
    @service = Google::Apis::Oauth2V2::Oauth2Service.new
    @options = { authorization: access_token }
  end

  def print_token_info
    token_info = @service.tokeninfo(options: @options)
    puts "-------- Token Info --------"
    puts "token_info.audience: #{token_info.audience}"
    puts "token_info.email: #{token_info.email}"
    puts "token_info.expires_in: #{token_info.expires_in}"
    puts "token_info.issued_to: #{token_info.issued_to}"
    puts "token_info.scope: #{token_info.scope}"
    puts "token_info.user_id: #{token_info.user_id}"
    puts "token_info.verified_email: #{token_info.verified_email}"
  end

  def get_user_info
    user_info = @service.get_userinfo(options: @options)
    @user_info_return = {"email": "#{user_info.email}", "name": "#{user_info.name}","picture": "#{user_info.picture}"}
  end
end
