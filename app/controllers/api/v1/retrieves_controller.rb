require_relative '../../../google_access_data/input'
require_relative '../../../google_access_data/oauth_client'
require_relative '../../../google_access_data/user_data_manager'

module Api
    module V1
        class RetrievesController < ApplicationController
            def retrieve
                input = Input.new params[:id]
                client = OAuthClient.new input.secrets
                access_token = client.code_to_access_token input.code
                manager = UserDataManager.new access_token
                @user_info = manager.get_user_info
                render json: {status: 'SUCCESS', message: 'Post is saved', body:@user_info}, status: :ok
            end
        end
    end
end