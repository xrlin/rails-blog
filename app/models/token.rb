class Token

  def self.encode(payload)
    JWT.encode payload, Rails.application.secrets.secret_key_base, 'HS256'
  end

  def self.decode(token)
    begin
      decoded_token = JWT.decode token, Rails.application.secrets.secret_key_base, true, { :algorithm => 'HS256' }
      # Actual payload
      decoded_token[0]
    rescue
      nil
    end
  rescue
    nil
  end

end
