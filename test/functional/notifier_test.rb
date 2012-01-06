require 'test_helper'

class NotifierTest < ActionMailer::TestCase
  test "order_shipped" do
    mail = Notifier.order_shipped
    assert_equal "Shipped", mail.subject
    assert_equal ["appyfizz@gmail.com"], mail.to
    assert_equal ["appyfizz@gmail.com"], mail.from
    assert_match "Hi", mail.body.encoded
  end

  test "order_received" do
    mail = Notifier.order_received
    assert_equal "Confirmed", mail.subject
    assert_equal ["appyfizz@gmail.com"], mail.to
    assert_equal ["appyfizz@gmail.com"], mail.from
    assert_match "Hi", mail.body.encoded
  end

end
