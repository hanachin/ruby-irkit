require File.expand_path 'test_helper', File.dirname(__FILE__)

class TestDevice < MiniTest::Test

  def setup
    @device = IRKit::Device.find.first
  end

  def test_get_messages
    data = @device.get_messages
    assert_equal data.class, IRKit::Data
  end

end
