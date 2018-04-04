# class Transactions::CreateTransaction
#   def initialize(date, amount, user_id, comment)
#     @date = date
#     @amount = amount
#     @user_id = user_id
#     @comment = comment
#   end
#
#   def create
#     ActiveRecord::Base.transaction do
#       create_transaction
#       update_user_account
#     end
#   end
#
#   private
#
#   attr_reader :date, :amount, :user_id, :comment
#
#   def create_transaction
#     @transaction = Transaction.create(
#       date: date.to_date,
#       amount: amount,
#       user_id: user_id,
#       comment: comment
#     )
#   end
#
#   def update_user_account
#     account = Account.where(user_id: user_id)
#     account.amount += amount
#     account.save!
#   end
# end