# frozen_string_literal: true

require_relative './input'
require_relative './oauth_client'
require_relative './user_data_manager'

input = Input.new
client = OAuthClient.new input.secrets
access_token = client.code_to_access_token input.code
manager = UserDataManager.new access_token
manager.print_token_info
manager.print_user_info
