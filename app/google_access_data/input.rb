# frozen_string_literal: true

require 'json'

class Input
  SECRETS_FILENAME = 'secrets.json'

  def initialize(code)
    @code = code
    puts "#{code}"
    if File.exists? SECRETS_FILENAME
      @secrets = JSON.parse(File.read(SECRETS_FILENAME))["web"]
    else
      puts "Please ensure there is a secret file named #{SECRETS_FILENAME} existing."
      @secrets = nil
    end

    unless @code
      puts "Please ensure the environment variable 'CODE' is set."
    end
  end

  def code
    @code
  end

  def secrets
    @secrets
  end
end
