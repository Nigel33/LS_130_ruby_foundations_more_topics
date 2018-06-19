require 'minitest/autorun'
require_relative 'cash_register'
require_relative 'transaction'

class CashRegisterTest < Minitest::Test
  def setup
    @register = CashRegister.new(20)
    @transaction = Transaction.new(5)
    @transaction.amount_paid = 10
  end

  def test_accept_money
    initial_amount = @register.total_money
    @register.accept_money(@transaction)
    final_amount = @register.total_money
    assert_equal(initial_amount + 10, final_amount)
  end

  def test_change
    final_change = @register.change(@transaction)
    cost = @transaction.item_cost
    amount_paid = @transaction.amount_paid
    change = amount_paid - cost
    assert_equal(change, final_change )
  end

  def test_give_receipt
    receipt = "You've paid $5"
    assert_output("#{receipt}.\n") {@register.give_receipt(@transaction)}
  end


end