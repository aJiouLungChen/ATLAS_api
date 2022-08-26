# frozen_string_literal: true

require 'signet/oauth_2/client'

class OAuthClient
  def initialize(secrets)
    @client = Signet::OAuth2::Client.new(
      authorization_uri: secrets["auth_uri"],
      token_credential_uri: secrets["token_uri"],
      client_id: secrets["client_id"],
      client_secret: secrets["client_secret"],
      redirect_uri: secrets["redirect_uris"].first,
      scope: ['email', 'profile'],
    )
  end

  def code_to_access_token(code)
    @client.code = code
    @client.fetch_access_token!
    @client.access_token
  end
end
