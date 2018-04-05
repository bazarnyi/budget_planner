class HomePageController < ApplicationController
  before_action :authenticate_user

  def index
    @form = TransactionForm.new(Transaction.new)
  end
end
