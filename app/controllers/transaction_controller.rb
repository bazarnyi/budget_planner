class TransactionController < ApplicationController
  def new
    @form = TransactionForm.new(Transaction.new)
  end
end
