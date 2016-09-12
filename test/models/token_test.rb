require 'test_helper'

class AdminTest < ActiveSupport::TestCase
  test "encode and decode token" do
    payload = { email: 'test@example.com' }
    token = Token.encode(payload)
    assert_equal token.blank?, false
    decode_payload = Token.decode(token)
    # Use symbolize_keys to uniform the keys in symbol, otherwise two hash may not equal
    assert_equal decode_payload.symbolize_keys!, payload
  end
end
