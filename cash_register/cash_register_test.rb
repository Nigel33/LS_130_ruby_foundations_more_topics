require 'minitest/autorun'
require_relative 'cash_register'
require_relative 'transaction'

class TestCashRegister < Minitest::Test
  def setup
    @register = CashRegister.new(200)
    @transaction = Transaction.new(10)
    @transaction.amount_paid = 20
  end

  # def test_accept_money
  #   assert_equal(220, @register.accept_money(@transaction))
  # end

  # def test_change
  #   assert_equal(10, @register.change(@transaction))
  # end

  def test_give_receipt
    output = <<~OUTPUT.chomp
    You've paid $#{@transaction.item_cost}.
    OUTPUT

    assert_equal(output, @register.give_receipt(@transaction))
  end

end